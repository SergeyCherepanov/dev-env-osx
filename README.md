# dev-env-osx
macOS Development Environment

[![Build Status](https://travis-ci.org/SergeyCherepanov/dev-env-osx.svg?branch=master)](https://travis-ci.org/SergeyCherepanov/dev-env-osx)  

## Installation 
1. Open the terminal (just type **terminal** into spotlight)
2. Execute: `xcode-select --install` (it's starts XCODE installation process)
3. Execute: `cd /tmp`
4. Execute: `git clone https://github.com/SergeyCherepanov/dev-env-osx.git`
5. Execute: `bash dev-env-osx/run.sh --ask-become-pass --tags="php71,percona57,nodejs,zsh"` or `bash dev-env-osx/run.sh --ask-become-pass --tags="php56,php70,php71,php72,percona56,percona57,nodejs,zsh"`  to make full install
(Wait for finish. Should be without "Fatal" messages)
6. Execute: `brew link php71` (setting default php for cli, you can choose other version (php56 or php70))
7. Open **System Preferences** > **LaunchRocket**
8. Press **Scan homebrew** and choose checkbox **At Login** near all you need services
9. Choose checkbox **As Root** for **Nginx** and **Dnsmasq**

## Tags
> You can choose one or all of them, tags don't have conflict
*  `zsh` - will install and configure ZSH with PowerLine and Oh-My-Zsh  
*  `php56` - will installs PHP version 5.6  
*  `php70` - will installs PHP version 7.0  
*  `php71` - will installs PHP version 7.1  
*  `php72` - will installs PHP version 7.2  
*  `percona56` - will installs Percona Server (mysql) version 5.6
*  `percona57` - will installs Percona Server (mysql) version 5.7  
*  `nodejs` - will installs NodeJS and NPM  

## Usage
Add folders with you source code into **www** folder in your home dir: **~/www/{pool}/{project_name}/**

#### Where:  
{pool} - second level domain name (resolver configured for `dev.com` and `loc.com`, but you can add more hosts directly to `/etc/hosts` file)
{project} - project name  

If **fqdn** of project should be **wordpress.dev.com**, directory structure must be:

`~/www/dev/wordpress/`

If subfolder **web** or **public** exists, server will use they as web root. For example:    

`~/www/dev/wordpress/web` or  `~/www/dev/wordpress/public`  

### Production domains
Sometimes we are require to use live domains like wordpress.com or google.com  

To do this, just create put source code of your project to `~/www/com/google` and update you `/etc/hosts` file by adding next line: `127.0.0.1 google.com`  

> Keep in mind the local live domains currently not supports ssl

### SSL

Root ca certificate is located in /usr/local/etc/openssl/localCA/cacert.pem

## PHP Multi-Version Support

Too choose a version of php you need define it via empty flag file in the project root directory, for example:  
`~/www/dev/wordpress/.php56` (php 5.6)  
`~/www/dev/wordpress/.php70` (php 7.0)  
`~/www/dev/wordpress/.php71` (php 7.1)  
`~/www/dev/wordpress/.php72` (php 7.2)  

## Mysql

* Mysql 5.6 binds to 3306 port  
* Mysql 5.7 binds to 3307 port  

## PHP Mail

In ~/mail directory will be drops letter what be sent via php **mail** function

## Change cli Java version

List available versions
```
jenv versions
```

Set 1.8 as default
```
jenv local 1.8
```
or
```
jenv global 1.8
```
