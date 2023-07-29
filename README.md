# Flutter Riverpod

# Diving Deep into Riverpod
In this article, we will explore the various components of Riverpod, its limitations, and solutions to those limitations. We will also discuss the next big thing in the Riverpod world. So, let's get started!

# Why do we need Riverpod?
There are certain problems with Provider that cannot be fixed, such as confusing syntax, multiple providers not having the same return data type, and the infamous "Provider not found" exception. To overcome these problems, Riverpod was introduced. It not only serves as a state management solution but also replaces design patterns like singletons, dependency injection, and service locators. It also helps in fetching, caching, and canceling network requests while handling error cases.

# Getting Started with Riverpod
--Types
# 1. Provider:
Provider is an object that provides data to widgets or other providers. It is a read-only widget and cannot update the value inside it. It can be used to provide primitive and non-primitive data types, as well as instances of classes.
To create a Provider, define a final variable with the desired type and assign it a value using a function. For example:

final nameProvider = Provider<String>((ref) => 'Pankaj');

To access the value provided by the nameProvider, you can use the Consumer widget or the ref.watch() method. For example:
final name = ref.watch(nameProvider); //Now you can use the value of name in your widget.

# Now, let's talk about the two types of reading methods.

# Consumer Widget
In this method, we wrap our widget with the Consumer widget. This gives us access to the context, ref, and child. We can listen to specific parts of the widget using the ref.watch method. This method allows us to get the value of the provider and store it in a variable.

--> ref.watch: This method continuously listens to changes in the variable. It is generally recommended to use this inside the build method.

--> ref.read: This method reads the variable only once. It is generally recommended to use this outside the build method.

Keep in mind that providers are read-only, so we can't update the value of a provider outside of its definition. If you have a stateful widget and want to access the widget ref, you can wrap it with the Consumer widget or extend the ConsumerState class.

# 2. State Provider :

--> State Provider is used to update the value from outside the provider.

--> State Provider is an upgrade over the normal provider.

--> The return data type of the State Provider can be nullable.

--> Access to the provider's value can be done using ref.watch within the build method.

--> To change the value of the State Provider, use ref.read and ref.read.notifier.update((state) => newValue)

"State Provider is used to update the value from outside the provider, which is not possible using the normal provider."

# 3. StateNotifier Provider:

StateNotifierProvider, which is used for complex values or classes that need to be updated or manipulated. It allows you to keep your logic in a single plcae, rather than scattering it around in different widgets.

StateNotifierProvider is a way to provide state management for our models.

Example:

Let's begin by a UserNotifier class that extends StateNotifier. This class will contain methods to update the name and age of a user.

class UserNotifier extends StateNotifier<User> {

UserNotifier(): super(User()); 

void updateName(String newName){
void updateAge(int newAge) {
state name = newName:
state age = newAge:
}
}

Now, we can use the StateNotifierProvider to provide the UserNotifier to our application. We need to specify the data type of the state, which in our case is User.

final userProvider = StateNotifier Provider((ref) => UserNotifier());

To access the state and update its values, we can use the ref.watch method. This will give us access to the UserNotifier and its state.

final user = ref.watch(userProvider);

Now, we can update the name and age of the user by calling the updateName and updateAge methods

user.updateName("Banku');
user.updateAge (25):

By using the StateNotifierProvider and StateNotifier, we can easily manage and update the state of our application

Earlier, we used the state controller with the state provider. However, now with the state notifier provider, we can access the entire class and call methods like updateName easily. This allows us to have all our business logic in one class and create multiple functions.

To update a property, we can use the state copyWith method. For example, if we want to update the age property, we can create a function called updateAge and call state.copyWith to update the value.

It's important to note that only when the value of the state changes, the clients listening to it will be notified. If we don't update the state value, nothing will be updated.

The state in the userNotifier class is immutable outside of the class but can be changed within the class.

If we want to define the state directly in the class itself, we can remove the super.state call in the constructor and pass the state directly in the class definition.

If we want to run a constructor when the userNotifier class is initiated, we can simply include the desired code within the constructor.

There is a third way to use the ref property, which is the select method. This allows us to rerun the widget tree only when a specific property, like name, changes. We can use the ref.watch method in combination with select to achieve this.

# 4. ChangeNotifierProvider

The ChangeNotifierProvider is similar to the StateProvider, but it is recommended to use the StateNotifier Provider instead. The ChangeNotifier Provider allows us to change the value of the state variable outside of the class, which can lead to mutable code and is not recommended.
