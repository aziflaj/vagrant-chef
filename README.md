# README
This is the [3rd project](https://github.com/aziflaj/52#week-3) for my **52 weeks, 52 projects** challenge. It shows how to create a virtual machine using Vagrant and Chef.

## Prerequisites
You should have [VirtualBox](https://www.virtualbox.org/wiki/Downloads) installed, as well as [Vagrant](http://vagrantup.com/).

## Set Up the VM
Firstly, install the Gem dependencies from the `Gemfile`:

```bash
$ bundle install
```

This will download `librarian-chef`, a tool for helping with Chef **cookbooks**.

> A cookbook is the fundamental unit of configuration and policy distribution in Chef. Each cookbook defines a scenario, such as everything needed to install and configure MySQL, and then it contains all of the components that are required to support that scenario. Chef maintains a collection of cookbooks that are important to Chef and are widely used by the Chef community. source: [Chef Supermarket](http://supermarket.chef.io/)

Also, it will add a `Gemfile.lock` file.

Then, download the cookbooks:

```bash
$ librarian-chef install
```

This will download the cookbooks. Also, it will create a `Cheffile.lock` file.

Finally, create the virtual machine:

```bash
$ vagrant up
```

This will create a virtual machine that runs Ubuntu 14.04 as Operating System, with all the configurations we did using Chef.
