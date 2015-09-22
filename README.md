subliminal Cookbook
===================
Installs [subliminal](http://subliminal.readthedocs.org/en/latest/) and its required dependencies.

Requirements
------------
#### python
Python and pip are required. They are set up as a dependency of this cookbook so it will be handled automatically. The python_pip lwrp will be used to install the desired packages.

#### cron
This is an optional dependency if you want to set up cron jobs.
The cron_d lwrp will be used to manage the cron jobs.

Attributes
----------
#### subliminal::cron
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['subliminal']['binary']</tt></td>
    <td>String</td>
    <td>path to the subliminal executable</td>
    <td><tt>/usr/local/bin/subliminal</tt></td>
  </tr>
  <tr>
    <td><tt>['subliminal']['log_directory']</tt></td>
    <td>String</td>
    <td>path to the subliminal log directory</td>
    <td><tt>/var/log/subliminal</tt></td>
  </tr>
  <tr>
    <td><tt>['subliminal']['verbose']</tt></td>
    <td>Boolean</td>
    <td>verbose output</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['subliminal']['very_verbose']</tt></td>
    <td>Boolean</td>
    <td>very verbose output</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['subliminal']['languages']</tt></td>
    <td>Array</td>
    <td>a list of languages to use</td>
    <td><tt>['en']</tt></td>
  </tr>
  <tr>
    <td><tt>['subliminal']['providers']</tt></td>
    <td>Array</td>
    <td>a list of providers to use</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['subliminal']['cron_jobs']</tt></td>
    <td>Array</td>
    <td>a list of hashes containing cron_d attributes</td>
    <td><tt>[]</tt></td>
  </tr>
</table>

Usage
-----
#### subliminal::default

It installs subliminal using the python pip provider.

#### subliminal::cron

It sets up cron jobs. The recipe performs the following actions:

* creates a `subliminal` system user
* creates the log directory
* creates cron jobs by using the cron_d provider

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github
