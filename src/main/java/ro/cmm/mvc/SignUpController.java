package ro.cmm.mvc;

import com.sun.org.apache.xpath.internal.operations.Mod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import ro.cmm.domain.User;
import ro.cmm.service.SecurityService;
import ro.cmm.service.UserService;
import ro.cmm.service.ValidationException;

import javax.validation.Valid;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Joseph Sunday, 23.04.2017 at 02:28.
 */
@Controller
@RequestMapping(value = "/signup")
public class SignUpController {

    private static Logger LOGGER = LoggerFactory.getLogger("SignUpController");


    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @RequestMapping(value = "")
    public ModelAndView signup(){
        ModelAndView modelAndView = new ModelAndView("user/signup");
        modelAndView.addObject("user", new User());
        return modelAndView;
    }

    @RequestMapping("/save")
    public ModelAndView save(
            @Valid @ModelAttribute("user") User user,
            BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        boolean hasErrors = false;
        if (!bindingResult.hasErrors()) {
            try {
                userService.save(user);
                modelAndView.addObject("currentUser",
                        securityService.getCurrentUser());
                RedirectView redirectView = new RedirectView("/");
                modelAndView.setView(redirectView);
            }catch (ValidationException e) {
                for (String msg : e.getCauses()) {
                    bindingResult.addError(new ObjectError("userLogin", msg));
                }
                hasErrors = true;
            }
        } else {
            hasErrors = true;
        }
        if (hasErrors){
            modelAndView = new ModelAndView("user/signup");
            modelAndView.addObject("errors", bindingResult.getAllErrors());
            modelAndView.addObject("user", user);
        }
        return modelAndView;
    }
}