This directory contains the following class files:

Authentication.cs		
        classes to help determine account information about the logged in user
CustomPrinciple.cs
        classes to help the dynamic role mechanism
Helpers.cs
        classes to hide and show menus based upon roles
message.cs
		class to help send strings as the viewModel
MustBeInRole
MustBeLoggedIn	
		classes to help with Role Info

LoginViewModel
RegistrationViewModel
		classes to help with registering a new account and logging into the system
VMBase
        class to be used in inheritance.  Used to help make VM classes where the
		exposed class is embedded in the ViewModel.  See this file for details.

VMXXX   The other classes that are derived from VMBase.  Each class exposes the Common
        Library file into the MVC layer.  These classes provide a place to add
		DataAnnotations and other functionality (like supporting dropdown items)