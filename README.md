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

