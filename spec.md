<!-- model : 
-1 has many
-at least 1 belongs to
at least 2 has many through -->

<!-- models should defend against invalid data  -->

-at least one classs level active record scope method

Your scope method must be chainable, meaning that you must use ActiveRecord Query methods (Links to an external site.) within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

-provide standard user authentification sign up login logout password

-omniauth (for fb, github)

-nested resource with appropriate RESTful URLS :
1 nested new route with form that relates to the parent resource
1 include nested index or show route

-forms should correctly display validation errors

Your fields should be enclosed within a fields_with_errors class
Error messages describing the validation failures must be present within the view.

