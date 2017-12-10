## bash script to catch emails sent from PHP

### the problem 

during development, I don't want my PHP app to send emails to the outside world
however I'd like to see what emails would be sent, and what they'd look like

There are other ways, for example installing disabling PH@s mail() function or
installing sendmail and then having a demon listening on port 25.
However they're all kind of complicated with varying degrees of side effects.

Much easier to simply configure PHP to talk to something that pretends to be sendmail!

### install 
```bash
mkdir -p /opt/dummy-smtp/mail/new
cp [download_dir]/sendmail.sh /opt/dummy-smtp/
chmod u+x g+x /opt/dummy-smtp/sendmail.sh
chmod -R a+rw /opt/dummy-smtp/mail
```

### edit php.ini
```ini
...
[mail function]
sendmail_path = /opt/dummy-smtp/sendmail.sh
...
```

### usage

invoking PHP's mail() function will create a new file located in /opt/dummy-smtp/mail/new

