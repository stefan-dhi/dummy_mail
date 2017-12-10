## Catch all emails sent from PHP

### the problem 

During development, I don't want my PHP app to send emails to the outside world,
but it'd still be useful to be able to see the various emails being generated.

There are various ways, for example installing disabling PHP's mail() function, or
installing sendmail and then having a demon listening on port 25, or using dedicated software.
However they're all kind of complicated with varying degrees of side effects.

Much easier to simply configure PHP to talk to something that only pretends to send mail!

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

Invoking PHP's mail() function will write the raw mail content to a uniquely named
file in /opt/dummy-smtp/mail/new ready for your perusal.

