# WPDistillery

This repo is a custom fork of WPDistillery designed to run on JCU Mac and PC labs without admin priviliges.  
See the instructions below for settings to customise to work on your OS.
For running on your own machine (admin privileges), you can just use the [regular version of WPDistillery](https://wpdistillery.org).

## Setup

To setup a new VM running Scotch Box and WordPress, follow these steps:

0. You may first need to change your *VirtualBox* preferences so the `Default Machine Folder` points to _your_ folder: *change "default" to "jc123456"* (your login)
1. In a terminal, run: `git clone https://github.com/lindsaymarkward/WPDistillery project` (where `project` is whatever you want to call your new WordPress VM folder)
2. (if you want) customise `wpdistillery/config.yml` (see [configuration file documentation](README_CONFIG.md))
3. Run `cd project` (same name as above) to change to your project root (where your `Vagrantfile` is)
4. Run `vagrant up` to load then boot your new VM.
5. On JCU Mac/PC computers, you can access your WordPress site at the local URL http://192.168.33.10
6. Login to WordPress then go to the admin settings and re-save the permalink settings (without editing, just save them).

![WPDistillery Logo](http://files.flurinduerst.ch/wpdistillery/wpdistillery_logo.png)

Version 2.3.6 (05.11.2018)

Created by [wpdistillery.org](https://wpdistillery.org)

## What is WPDistillery

WP Distillery does all the work for you when setting up a new WordPress project with [Scotch Box](https://box.scotch.io/). Simply add your preferred theme, plugins, and options into `config.yml` and you're good to go! With WPDistillery it won't take longer than 5 minutes until you can start working on your new WordPress project.

One simple command will:

- Install Scotch Box
- Install and update requirements on the local webserver
- Download, install, and configure WordPress
- Set WordPress options
- Install and activate your favorite WordPress theme (default: [WPSeed](https://wpseed.org))
- Remove default themes
- Install and activate the plugins defined in the config files
- Clean the contents, plugins, unused files, and other Wordpress defaults

You're able to adjust which of the above tasks will be executed. Simply set the desired tasks to `true` or `false` in the **Setup Options** section at the bottom of `config.yml`. All you need to do after customizing your config file is `vagrant up`. That's it! With that one single command WPDistillery will:

1. SSH to the VM
1. Update WP-CLI
1. Install and configure everything

It also comes with an optional auto-update function and integrated support for Windows. Check out the [Changelog](CHANGELOG.md) for a complete list of changes.

WPDistillery is fully compatible with [Scotchbox 3.0](https://box.scotch.io/)

## Demo

[![WPDistillery Setup Video](http://files.flurinduerst.ch/wpdistillery/demovideo_thumb2.png)](https://youtu.be/y1GtIiODsxM)

## Dependencies

- [ScotchBox](https://box.scotch.io) (using [Vagrant](https://vagrantup.com) & [Virtualbox](https://virtualbox.org))
- [Vagrant Hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater) (`vagrant plugin install vagrant-hostsupdater`)

## Additional Information

### WPDistillery with WP-Multisite

Using this [Pull Request](https://github.com/flurinduerst/WPDistillery/pull/45) you can add multisite capability for your project. We [decided](https://github.com/flurinduerst/WPDistillery/issues/59) to not merge the PR to keep WPDistillery as clean as it is.

### Auto Update WordPress and Plugins

If you want to automatically update WordPress and all Plugins on every `vagrant up` you can remove the comment character at line 26 inside the Vagrantfile.

### Windows Support

Using Windows? No Problem! WPDistillery will detect if you're using Windows and if so, automatically convert all files using dos2unix.

### Basic Vagrant Commands

- `vagrant up` will start the machine. The first ever `vagrant up` in your project will also install Scotch Box and execute provisioning.
- `vagrant provision` will execute provisioning. This is where WPDistillery runs its core function which is installing and configuring WordPress according to `config.yml`. Before that, it will also update WP-CLI and set the upload size to 64MB. Normally `vagrant provision` should not be executed manually but can be used to re-run the WPDistillery setup in case you want to re-install WordPress.
- `vagrant reload` will restart Vagrant. This is required for changes made in the `Vagrantfile` to take effect.
- `vagrant halt` will shut down the virtual machine.
- `vagrant destroy` will destroy all the resources related to the current virtual machine. This action is not reversable.

 More informations can be found at [vagrantup.com](https://vagrantup.com).

## Troubleshooting

Something went wrong within the WPDistillery setup. I'd like to restart the setup:

- Fix your setting (probably in `wpdistillery/config.yml` or `Vagrantfile`)
- Remove all tables from the `scotchbox` database
- Remove the `public` folder
- Run `vagrant reload --provision`

## About

- Author: [Flurin Dürst](https://github.com/flurinduerst) | [Twitter](https://twitter.com/flurinduerst)
- Contributors:
  - [@ShaneShipston](https://github.com/ShaneShipston)
  - [@drawcard](https://github.com/drawcard)
  - [@thursby](https://github.com/thursby)
  - [@tgroff](https://github.com/tgroff)
  - [@mohnjatthews](https://github.com/mohnjatthews)

### Contribute

- Fork it
- Create your feature branch
- Commit your changes
- Push to the branch
- Create new a Pull Request

Feel free to contact me if you have questions or need any advice.

### License

WPDistillery is released under the MIT Public License.

Note: The "About" section in `README.md` and the author (`@author`) notice in the file-headers shall not be edited or deleted without permission. For details, please see [License](LICENSE).

I’m putting a lot of time into maintaining WPDistillery, so please consider [donating](https://www.paypal.me/FlurinDuerst/10) or [sharing](https://twitter.com/intent/tweet?url=https%3A%2F%2Fwpdistillery.org). Thank you!
