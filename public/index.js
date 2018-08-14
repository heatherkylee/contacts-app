/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/api/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        email: this.email, password: this.password
      };
      axios
        .post("/api/sessions", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var ContactsPage = {
  template: "#contacts-page",
  data: function() {
    return {
      message: "Contacts!",
      contacts: []
    };
  },
  created: function() {
    axios.get("/api/contacts").then(function(response) {
      console.log(response.data);
      this.contacts = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var ContactsNewPage = {
  template: "#contacts-new-page",
  data: function() {
    return {
      message: "Add a New Contact",
      contact: {
        firstName: "",
        lastName: "",
        email: "",
        phoneNumber: "",
        middleName: "",
        bio: ""
      },
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        input_first_name: this.contact.firstName,
        input_last_name: this.contact.lastName,
        input_email: this.contact.email,
        input_phone_number: this.contact.phone_number,
        input_middle_name: this.contact.middleName,
        input_bio: this.contact.bio
      };
      axios
        .post("/api/contacts", params)
        .then(function(response) {
          console.log(response);
          router.push("/contacts");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/contacts", component: ContactsPage },
    { path: "/contacts/new", component: ContactsNewPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    console.log(jwt);
    console.log("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});


