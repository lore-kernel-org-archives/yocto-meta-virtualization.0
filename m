Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 72C14E00E0E; Tue, 20 Feb 2018 14:06:32 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.53 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65C17E00D91
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Feb 2018 14:06:30 -0800 (PST)
Received: by mail-lf0-f53.google.com with SMTP id v9so6376884lfa.11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Feb 2018 14:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=aDDntsUygyVlYSy5U2cM0qqTnn30JLtAzAKYngOm9PI=;
	b=FcoadTbYRFATAdV/H5RR8kZCK3pkYYXErf7geyzUsf7Jcu7VsoKcbeS6wb6dOTsGPS
	jRzTqiGqddZpBff/9VUdh8E2BxySVfBTJ067uLP4gEilSqbYRLhcucEhqBKZ0q3T7WCK
	5PamEnms3sKEr0/sb4eXEdNLsm7+pFFVsh8w3W/if2yGQ3stmr4cU/Hk4OEVgG8/CM8t
	ragA95ABYNJmFmbAU6oMF4iGS/T6dbCS5xvdMVKjQ9334wVOzDh4auMCQ99+owb3biWN
	ewy/KOB7xDWZlV22U0i9aKi489IQy60lXjwLRN1WXliVDE8GWjFIwl+gWOBqAB5cdA4k
	RM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=aDDntsUygyVlYSy5U2cM0qqTnn30JLtAzAKYngOm9PI=;
	b=Ce4VCwEhLh0xZ9wpY6Aw0vqR4xRpBmOUw1qTUtLtvEFliH4HY+eiONEPIGEX3VpDfQ
	kRrwG676pAZUUxlfzntt+xvtMjR6YYY7tj1IY2yw/MPJAyDNe9xfbwoSbdt3apqbauu8
	meOPv0JJXJOIBBNgc13wzpmxRF5eZodgbwGhz9pcN0veGYlCNCCNfPbouogBK3e+UqUn
	qQiATKD6VmfuLpzPbWz2/zwZy8D6oKp5ptpZ0/SATxWlH/WoVkOIykdKsyuMGDE1auXx
	ngQqcSBbLATyWIpWY7cwcrl2OsQ0P9jl67Xo7lmc8L9W30cTOYeNpVj4UDJGmzY/X+L3
	4vCQ==
X-Gm-Message-State: APf1xPCcDuosdID+ZpxJx3y1Ykgp38RMi2ZukvFd5tu2NP3QMYZMg1cU
	WdspV5H8KHYoh5XX2eZAeNef4iKgrGsaBd+jh2g=
X-Google-Smtp-Source: AH8x227CenoEpIogjw1Pgx9D1d8ohxz5agEM+ddNrpgM51yFJn/v30xCJ8eO8KhZNxEenGHhpFwpZeRnQYaa1VK4hwg=
X-Received: by 10.25.181.8 with SMTP id e8mr708804lff.94.1519164388725; Tue,
	20 Feb 2018 14:06:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Tue, 20 Feb 2018 14:06:28 -0800 (PST)
In-Reply-To: <20180215223324.26179-1-psaavedra@igalia.com>
References: <307b5fbe-b22a-dc01-c117-ad846a93fd22@igalia.com>
	<20180215223324.26179-1-psaavedra@igalia.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 20 Feb 2018 17:06:28 -0500
Message-ID: <CADkTA4M0nQ3cqnHBMZqROEQ02D0q_y+=Qbud4vJ-KL_vZ2+HsA@mail.gmail.com>
To: Pablo Saavedra <psaavedra@igalia.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH v2] Puppet upstream upgrade to 5.4.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Feb 2018 22:06:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Pablo,

The long log explained the changes very well, so I have no issues or
further questions.

This has now been merged.

Bruce

On Thu, Feb 15, 2018 at 5:33 PM, Pablo Saavedra <psaavedra@igalia.com> wrot=
e:
> * Upstream to 5.4.0 [1][2][3][4][5]
> * Puppet 5 recipe is the official Puppet agent version
>   with support for Ruby 2.4 [6]
> * Updated reference versions in the README file
> * Hiera isn=E2=80=99t separate from Puppet anymore [7].
>   * Do not install extlookup2hiera, it has been removed upstream
>   * Hiera began as an independent Ruby library that worked with
>     Puppet. Over time, it became a requirement and was even included
>     in the puppet-agent package, but it was limited by its original
>     design.
> * Removed puppet_3.7.3.bb recipe
> * Drop the superseded patches
> * Added init script
> * Added systemd script
>
> Facter 2.5 upstream release
>
> * Puppet 5 relays on Facter 3.10. Facter 3.10 reworks Facter 2.X
>   code [8] in native code instead of Ruby gem. Facter 2.5 is
>   still compatible with 5 series to help with Puppet 5 testing.
>
> * facter before 2.4.0 uses a deprecated Puppet settings API
>   making `facter --puppet` no longer work with Puppet 4 or
>   higher [9].
>
> * Community, partner, and some of Puppet's internal testing
>   workflows continue to use (ruby) Facter 2.4 [10], instead of
>   native Facter 3, which is not (yet) available as a gem.
>
> * To help with Puppet 5 testing, we need to do a maintenance
>   release in the Facter 2 series.
>
> [1] https://docs.puppet.com/puppet/5.0/release_notes.html
> [2] https://docs.puppet.com/puppet/5.1/release_notes.html
> [3] https://docs.puppet.com/puppet/5.2/release_notes.html
> [4] https://docs.puppet.com/puppet/5.3/release_notes.html
> [5] https://docs.puppet.com/puppet/5.4/release_notes.html
> [6] https://puppet.com/docs/puppet/4.10/hiera_intro.html
> [7] https://tickets.puppetlabs.com/browse/PA-1107
> [8] https://github.com/puppetlabs/facter/tree/3.10.x
> [9] http://metadata.ftp-master.debian.org/changelogs/main/p/puppet/puppet=
_5.1.0-1_changelog
> [10] https://tickets.puppetlabs.com/browse/FACT-1630
>
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>  .../facter/{facter_2.3.0.bb =3D> facter_2.5.0.bb}    |  4 +-
>  recipes-support/puppet/README                      | 12 +++-
>  ...uplicate-key-which-ruby-2.2-complains-abo.patch | 30 ---------
>  .../puppet/puppet/add_puppet_gemspec.patch         |  2 +-
>  ...aint-Change-spec-test-to-pass-on-ruby-2.2.patch | 37 -----------
>  recipes-support/puppet/puppet/puppet.init          | 72 ++++++++++++++++=
++++++
>  recipes-support/puppet/puppet/puppet.service       | 10 +++
>  ..._yaml-syck-isn-t-available-for-Ruby-2.0.0.patch | 35 -----------
>  .../puppet/{puppet_3.7.3.bb =3D> puppet_5.4.0.bb}    | 30 ++++++---
>  9 files changed, 114 insertions(+), 118 deletions(-)
>  rename recipes-support/facter/{facter_2.3.0.bb =3D> facter_2.5.0.bb} (74=
%)
>  delete mode 100644 recipes-support/puppet/puppet/MAINT-Fix-duplicate-key=
-which-ruby-2.2-complains-abo.patch
>  delete mode 100644 recipes-support/puppet/puppet/maint-Change-spec-test-=
to-pass-on-ruby-2.2.patch
>  create mode 100644 recipes-support/puppet/puppet/puppet.init
>  create mode 100644 recipes-support/puppet/puppet/puppet.service
>  delete mode 100644 recipes-support/puppet/puppet/safe_yaml-syck-isn-t-av=
ailable-for-Ruby-2.0.0.patch
>  rename recipes-support/puppet/{puppet_3.7.3.bb =3D> puppet_5.4.0.bb} (51=
%)
>
> diff --git a/recipes-support/facter/facter_2.3.0.bb b/recipes-support/fac=
ter/facter_2.5.0.bb
> similarity index 74%
> rename from recipes-support/facter/facter_2.3.0.bb
> rename to recipes-support/facter/facter_2.5.0.bb
> index b5a46e7..ef04e93 100644
> --- a/recipes-support/facter/facter_2.3.0.bb
> +++ b/recipes-support/facter/facter_2.5.0.bb
> @@ -7,8 +7,8 @@ SRC_URI =3D " \
>      http://downloads.puppetlabs.com/facter/facter-${PV}.tar.gz \
>      file://add_facter_gemspec.patch \
>  "
> -SRC_URI[md5sum] =3D "7bb6dbeaef86cd79300b4723c06932bc"
> -SRC_URI[sha256sum] =3D "a91ea915b276172e002a8670684e5c6be7df1dfdd55db693=
7d27fffad70c5e51"
> +SRC_URI[md5sum] =3D "58b6b609f19d1c146c600c4dc6e7fa39"
> +SRC_URI[sha256sum] =3D "47ccbfb8a69e4d48c3c88e47ac1ae754fcc583d4090fa9d8=
38461b3ede7b07cb"
>
>  inherit ruby
>
> diff --git a/recipes-support/puppet/README b/recipes-support/puppet/READM=
E
> index 2de808a..8befb15 100644
> --- a/recipes-support/puppet/README
> +++ b/recipes-support/puppet/README
> @@ -6,11 +6,17 @@ state of your IT infrastructure, then automatically enf=
orces the correct state.
>
>  Basic Requirements
>  ------------------------
> -Ruby 1.8.7 or later
> -Facter 1.7.0 or later
> -Hiera 1.0 or later
> +Ruby 2.4 or later
> +Facter 3.10.0 or later
> +Hiera 5 or later [1]
>  The json gem (any modern version)
>
> +[1] Hiera isn=E2=80=99t separate from Puppet anymore
> +    Hiera began as an independent Ruby library that worked with Puppet.
> +    Over time, it became a requirement and was even included in the
> +    puppet-agent package, but it was limited by its original design.
> +
> +    https://puppet.com/docs/puppet/4.10/hiera_intro.html
>
>  Simple Demo
>  ------------------------
> diff --git a/recipes-support/puppet/puppet/MAINT-Fix-duplicate-key-which-=
ruby-2.2-complains-abo.patch b/recipes-support/puppet/puppet/MAINT-Fix-dupl=
icate-key-which-ruby-2.2-complains-abo.patch
> deleted file mode 100644
> index 696c642..0000000
> --- a/recipes-support/puppet/puppet/MAINT-Fix-duplicate-key-which-ruby-2.=
2-complains-abo.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 05dad9b1d30a8ff1e8e4a06bc5eaf0b19dab43e2 Mon Sep 17 00:00:00 2001
> -From: Jasper Lievisse Adriaanse <jasper@humppa.nl>
> -Date: Fri, 24 Jul 2015 20:18:08 +0200
> -Subject: [PATCH] (MAINT) Fix duplicate key which ruby 2.2 complains abou=
t
> -
> -commit 05dad9b1d30a8ff1e8e4a06bc5eaf0b19dab43e2 from
> -https://github.com/puppetlabs/puppet.git
> -
> ----
> - lib/puppet/defaults.rb | 4 ----
> - 1 file changed, 4 deletions(-)
> -
> -diff --git a/lib/puppet/defaults.rb b/lib/puppet/defaults.rb
> -index eeefefa..b591697 100644
> ---- a/lib/puppet/defaults.rb
> -+++ b/lib/puppet/defaults.rb
> -@@ -486,10 +486,6 @@ module Puppet
> -       :default    =3D> "stomp",
> -       :desc       =3D> "Which type of queue to use for asynchronous pro=
cessing.",
> -     },
> --    :queue_type =3D> {
> --      :default    =3D> "stomp",
> --      :desc       =3D> "Which type of queue to use for asynchronous pro=
cessing.",
> --    },
> -     :queue_source =3D> {
> -       :default    =3D> "stomp://localhost:61613/",
> -       :desc       =3D> "Which type of queue to use for asynchronous pro=
cessing.  If your stomp server requires
> ---
> -2.1.4
> -
> diff --git a/recipes-support/puppet/puppet/add_puppet_gemspec.patch b/rec=
ipes-support/puppet/puppet/add_puppet_gemspec.patch
> index a5c8e3b..50c215c 100644
> --- a/recipes-support/puppet/puppet/add_puppet_gemspec.patch
> +++ b/recipes-support/puppet/puppet/add_puppet_gemspec.patch
> @@ -17,7 +17,7 @@ diff -urN puppet-3.7.3_ori/puppet.gemspec puppet-3.7.3/=
puppet.gemspec
>  +  s.license =3D 'Apache 2.0'
>  +
>  +  s.bindir       =3D 'bin'
> -+  s.executables  =3D ['puppet', 'extlookup2hiera']
> ++  s.executables  =3D ['puppet']
>  +  s.require_path =3D 'lib'
>  +  s.files =3D %w(LICENSE README.md Rakefile) + Dir.glob('{lib,spec}/**/=
*')
>  +end
> diff --git a/recipes-support/puppet/puppet/maint-Change-spec-test-to-pass=
-on-ruby-2.2.patch b/recipes-support/puppet/puppet/maint-Change-spec-test-t=
o-pass-on-ruby-2.2.patch
> deleted file mode 100644
> index 73e1769..0000000
> --- a/recipes-support/puppet/puppet/maint-Change-spec-test-to-pass-on-rub=
y-2.2.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From d183826136ca77847da5f3e460f2e460faabc5be Mon Sep 17 00:00:00 2001
> -From: Kylo Ginsberg <kylo@puppetlabs.com>
> -Date: Mon, 22 Dec 2014 10:11:38 -0800
> -Subject: [PATCH] (maint) Change spec test to pass on ruby 2.2
> -
> -commit d183826136ca77847da5f3e460f2e460faabc5be from
> -https://github.com/puppetlabs/puppet.git
> -
> -Prior to this change, this spec test failed on ruby 2.2.0-rc1 with:
> -
> -     Failure/Error: Time.stubs(:now).returns(Time.parse("2011-01-06 12:0=
0:00 UTC"))
> -     NoMethodError:
> -       undefined method `utc_offset' for nil:NilClass
> -
> -I didn't track down the root cause of this failure, but just
> -normalized this stub to use Time.utc, which (along with Time.local)
> -is the more common way of stubbing Time objects in the codebase.
> ----
> - spec/unit/reports/store_spec.rb | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/spec/unit/reports/store_spec.rb b/spec/unit/reports/store_s=
pec.rb
> -index 7f94f7d..f56eccd 100755
> ---- a/spec/unit/reports/store_spec.rb
> -+++ b/spec/unit/reports/store_spec.rb
> -@@ -24,7 +24,7 @@ describe processor do
> -     end
> -
> -     it "should write the report to the file in YAML" do
> --      Time.stubs(:now).returns(Time.parse("2011-01-06 12:00:00 UTC"))
> -+      Time.stubs(:now).returns(Time.utc(2011,01,06,12,00,00))
> -       @report.process
> -
> -       File.read(File.join(Puppet[:reportdir], @report.host, "2011010612=
00.yaml")).should =3D=3D @report.to_yaml
> ---
> -2.1.4
> -
> diff --git a/recipes-support/puppet/puppet/puppet.init b/recipes-support/=
puppet/puppet/puppet.init
> new file mode 100644
> index 0000000..64ab32e
> --- /dev/null
> +++ b/recipes-support/puppet/puppet/puppet.init
> @@ -0,0 +1,72 @@
> +#!/bin/bash
> +#
> +# chkconfig: 35 20 80
> +# description: The puppet agent connects to a puppet master, requests a
> +#              catalog of resources, and configures the local system.
> +#
> +
> +# Get function from functions library
> +. /etc/init.d/functions
> +
> +PATH=3D/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
> +DAEMON=3D/usr/bin/puppet
> +DAEMON_OPTS=3D"agent --server master --no-daemonize"
> +NAME=3D"agent"
> +DESC=3D"puppet agent"
> +PIDFILE=3D"/var/run/${NAME}.pid"
> +PID=3D`test -f $PIDFILE && cat $PIDFILE`
> +RETVAL=3D0
> +
> +test -x $DAEMON || exit 0
> +
> +[ -r /etc/default/puppet ] && . /etc/default/puppet
> +
> +reload_puppet_agent() {
> +    start-stop-daemon --stop --quiet --signal HUP --pidfile $PIDFILE
> +}
> +
> +start_puppet_agent() {
> +    start-stop-daemon --start --quiet --pidfile $PIDFILE \
> +        --startas $DAEMON -- $NAME $DAEMON_OPTS
> +}
> +
> +stop_puppet_agent() {
> +    start-stop-daemon --stop --retry TERM/10/KILL/5 --quiet --oknodo --p=
idfile $PIDFILE
> +}
> +
> +status_puppet_agent() {
> +    status_of_proc -p "${PIDFILE}" "${DAEMON}" "${NAME}"
> +}
> +
> +case "$1" in
> +    start)
> +        echo -n "Starting $DESC"
> +        start_puppet_agent
> +        log_end_msg $?
> +        ;;
> +    stop)
> +        echo -n "Stopping $DESC"
> +        stop_puppet_agent
> +        log_end_msg $?
> +        ;;
> +    reload)
> +        echo -n "Reloading $DESC"
> +        reload_puppet_agent
> +        log_end_msg $?
> +        ;;
> +    status)
> +        status_puppet_agent
> +        ;;
> +    restart|force-reload)
> +        echo -n "Restarting $DESC"
> +        stop_puppet_agent
> +        start_puppet_agent
> +        log_end_msg $?
> +        ;;
> +*)
> +        echo "Usage: $0 {start|stop|status|restart|force-reload|reload}"=
 >&2
> +        exit 1
> +        ;;
> +esac
> +
> +exit 0
> diff --git a/recipes-support/puppet/puppet/puppet.service b/recipes-suppo=
rt/puppet/puppet/puppet.service
> new file mode 100644
> index 0000000..c49dacf
> --- /dev/null
> +++ b/recipes-support/puppet/puppet/puppet.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=3DPuppet agent
> +After=3Dnetwork.target
> +
> +[Service]
> +ExecStart=3D/usr/bin/puppet agent --server master --no-daemonize
> +ExecReload=3D/bin/kill -HUP $MAINPID
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/recipes-support/puppet/puppet/safe_yaml-syck-isn-t-available=
-for-Ruby-2.0.0.patch b/recipes-support/puppet/puppet/safe_yaml-syck-isn-t-=
available-for-Ruby-2.0.0.patch
> deleted file mode 100644
> index 1cd5e25..0000000
> --- a/recipes-support/puppet/puppet/safe_yaml-syck-isn-t-available-for-Ru=
by-2.0.0.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From fca1579d62d5b978375511e062b9c18f4413dd5a Mon Sep 17 00:00:00 2001
> -From: Mark Asselstine <mark.asselstine@windriver.com>
> -Date: Thu, 20 Aug 2015 14:06:32 -0400
> -Subject: [PATCH] safe_yaml: syck isn't available for Ruby >=3D 2.0.0
> -
> -This change was taken from various puppet forks but does not exist in
> -puppet upstream as they drop support for YAML on the network as part
> -of work to fix PUP-3272.
> -
> -https://tickets.puppetlabs.com/browse/PUP-3272
> -
> -Community versions of this change:
> -https://github.com/kylog/puppet/commit/42b2e77ec24dfbbf2317d08615a35127a=
fbc4782
> -
> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ----
> - lib/puppet/vendor/safe_yaml/lib/safe_yaml.rb | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/lib/puppet/vendor/safe_yaml/lib/safe_yaml.rb b/lib/puppet/v=
endor/safe_yaml/lib/safe_yaml.rb
> -index 8670ace..722dd3e 100644
> ---- a/lib/puppet/vendor/safe_yaml/lib/safe_yaml.rb
> -+++ b/lib/puppet/vendor/safe_yaml/lib/safe_yaml.rb
> -@@ -3,7 +3,7 @@ require "yaml"
> - # This needs to be defined up front in case any internal classes need t=
o base
> - # their behavior off of this.
> - module SafeYAML
> --  YAML_ENGINE =3D defined?(YAML::ENGINE) ? YAML::ENGINE.yamler : "syck"
> -+  YAML_ENGINE =3D defined?(YAML::ENGINE) ? YAML::ENGINE.yamler : (defin=
ed?(Psych) && YAML =3D=3D Psych ? "psych" : "syck")
> - end
> -
> - require "set"
> ---
> -2.1.4
> -
> diff --git a/recipes-support/puppet/puppet_3.7.3.bb b/recipes-support/pup=
pet/puppet_5.4.0.bb
> similarity index 51%
> rename from recipes-support/puppet/puppet_3.7.3.bb
> rename to recipes-support/puppet/puppet_5.4.0.bb
> index 3e8f869..54574e4 100644
> --- a/recipes-support/puppet/puppet_3.7.3.bb
> +++ b/recipes-support/puppet/puppet_5.4.0.bb
> @@ -1,37 +1,41 @@
>  SUMMARY =3D "Open source Puppet is a configuration management system"
>  HOMEPAGE =3D "https://puppetlabs.com/puppet/puppet-open-source"
>  LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df257790c70561550fd666c6e0044f=
d89"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7c9045ec00cc0d6b6e0e09ee811da=
4a0"
>
>  SRC_URI =3D " \
>      https://downloads.puppetlabs.com/puppet/puppet-${PV}.tar.gz \
>      file://add_puppet_gemspec.patch \
>      file://puppet.conf \
> -    file://maint-Change-spec-test-to-pass-on-ruby-2.2.patch \
> -    file://MAINT-Fix-duplicate-key-which-ruby-2.2-complains-abo.patch \
> -    file://safe_yaml-syck-isn-t-available-for-Ruby-2.0.0.patch \
> +    file://puppet.init \
> +    file://puppet.service \
>  "
> -SRC_URI[md5sum] =3D "cc294da1d51df07bcc7f6cf78bd90ce0"
> -SRC_URI[sha256sum] =3D "4a3bd7ddb51072c3dd898a8de158cde204a2d8fd0b84e8ac=
806b84c074348637"
> +SRC_URI[md5sum] =3D "e26702fbfb464121d8d60e639ea254d9"
> +SRC_URI[sha256sum] =3D "8db3a89c9ced01b43c57f89e42d099a763d02f38bcea5d6c=
73e1245556932bb2"
>
> -inherit ruby
> +inherit ruby update-rc.d systemd
>
>  DEPENDS +=3D " \
>          ruby \
>          facter \
> -        hiera \
>  "
>
>  RDEPENDS_${PN} +=3D " \
>          ruby \
>          facter \
> -        hiera \
>          ruby-shadow \
>          bash \
>  "
>
>  RUBY_INSTALL_GEMS =3D "puppet-${PV}.gem"
>
> +INITSCRIPT_NAME =3D "${BPN}"
> +INITSCRIPT_PARAMS =3D "start 02 5 3 2 . stop 20 0 1 6 ."
> +
> +SYSTEMD_AUTO_ENABLE =3D "enable"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_SERVICE_${PN} =3D "${BPN}.service"
> +
>  do_install_append() {
>      install -d ${D}${sysconfdir}/puppet
>      install -d ${D}${sysconfdir}/puppet/manifests
> @@ -39,6 +43,12 @@ do_install_append() {
>
>      install -m 655 ${S}/conf/auth.conf ${D}${sysconfdir}/puppet/
>      install -m 655 ${S}/conf/fileserver.conf ${D}${sysconfdir}/puppet/
> -    install -m 655 ${S}/conf/tagmail.conf ${D}${sysconfdir}/puppet/
> +    install -m 655 ${S}/conf/environment.conf ${D}${sysconfdir}/puppet/
>      install -m 655 ${WORKDIR}/puppet.conf ${D}${sysconfdir}/puppet/
> +
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/puppet.service ${D}${systemd_unitdir}/sys=
tem
> +
> +    install -d ${D}${sysconfdir}/init.d
> +    install -m 0755 ${WORKDIR}/puppet.init ${D}${sysconfdir}/init.d/pupp=
et
>  }
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

