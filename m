Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.3599.1594263764501211006
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jul 2020 20:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZGDjp8+S;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id l12so624115ejn.10
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Jul 2020 20:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ocHyv1vnShLuyd1MXnR12mR7TL12Tk85e4i5mO0JT+o=;
        b=ZGDjp8+S554UZjOK3VxkIXL/lGvGPSrzQ+R+ttpmoNDaVhp8ezTNXlv3oH44vQ1FuR
         36GaIHTuDmyfDY72sstd20WTEPNmyQJysq6ky/vpPYzrtwb1brKD4QOrAse03S6dLVFO
         1xsXdX+yeJZRGhKVhyPg8UASJ6Onv8f9fmCvTR0B1Q8VyfYC7G7qDePAYRd8kUbyBnGm
         aESCZWBf4IE2EzY04lhJQtwG1SJku5tfj5kR2euczvH7tt0uPuPk7qdkzOCQ+3X4UMsW
         SP2aPHOyZ0/3ZKvNN2woJ9cBf31eU2rA8F1SZKZXwxHIodmvYDK3hIPrbhaZGw7UAJ2U
         wm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ocHyv1vnShLuyd1MXnR12mR7TL12Tk85e4i5mO0JT+o=;
        b=JZGpxeyWfXleG/PqegCj5yOiDHCXbtx8cQeD7SX0qVFNU9/WDeaek5akm2DEIlKSXe
         3dVCiwrvQUQRKF8vfY610OFZANtkuggGwrlHBLnmzE5A4DIhqDuWJJm4uCSYNRLYzP8M
         te77HbyYTiVqIWF/6+HByRVGM9e0pQTy1F6/3RJEm3hLpPsaTvfDYnxKaupAMaNC9B2G
         XdBY5gzWVp0q2XoeQogUM8KbCiBhHPCZmJ/n1COyf6zYbI3fUT2RKTz6jtEQwrBdDK/t
         mNKTyr+KJ8SYXXOGRxcuZjPQJQ3zaPSeKij2C+EWbikdrkonr6lEvokUcl6iIeucwxoW
         tylQ==
X-Gm-Message-State: AOAM5330AaTz9VND+Umtob9QtkdsMcM62BA2ltyFU4/fWFdrVnEDA96T
	468zplMbR1DLnypogkCpnhrQJWPFRwUGw56BGT4=
X-Google-Smtp-Source: ABdhPJwEpDL6IcV5yg+0jIJmHyeaVvLym40Y8Nb/S9jWsk7a1vWS7WKoZxYxzcKeb5rMwlpnlZCSZaTlg9MhTFRq6vk=
X-Received: by 2002:a17:906:5283:: with SMTP id c3mr51560741ejm.22.1594263762794;
 Wed, 08 Jul 2020 20:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200708181625.81840-1-paulohefagundes@gmail.com>
In-Reply-To: <20200708181625.81840-1-paulohefagundes@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 8 Jul 2020 23:02:31 -0400
Message-ID: <CADkTA4P65T3DgutJLAXe0c+15i8Jze-nWGgGeMUt5h9nYU5GwQ@mail.gmail.com>
Subject: Re: [meta-virtualization][m-c-s][PATCH] salt: bump 3000 -> 3001
To: "Fagundes, Paulo" <paulohefagundes@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hmmm.

This doesn't apply on master for me, but there haven't been any other
changes to it recently, so I can't explain why .. but yet:

build [/home/bruc...d-services]> git am -s salt.mbox
Applying: salt: bump 3000 -> 3001
error: patch failed:
meta-openstack/recipes-support/salt/salt/set_python_location_hashbang.patch:1
error: meta-openstack/recipes-support/salt/salt/set_python_location_hashbang.patch:
patch does not apply
error: meta-openstack/recipes-support/salt/salt_3001.bb: already
exists in working directory
Patch failed at 0001 salt: bump 3000 -> 3001
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

It looks like bad formatting on the patch ? Did you send it with
git-send email ?

I can't say that I recall why we had the lsb in the RRECOMMENDS, but
lsb-release should do the job. As long as it is working in your tests,
I'm ok with it.

Bruce

On Wed, Jul 8, 2020 at 2:18 PM Fagundes, Paulo
<paulohefagundes@gmail.com> wrote:
>
> Signed-off-by: Paulo Fagundes <paulohefagundes@gmail.com>
> ---
>  .../salt/set_python_location_hashbang.patch   | 158 ------------------
>  .../salt/{salt_3000.bb => salt_3001.bb}       |   7 +-
>  2 files changed, 3 insertions(+), 162 deletions(-)
>  delete mode 100644 meta-openstack/recipes-support/salt/salt/set_python_location_hashbang.patch
>  rename meta-openstack/recipes-support/salt/{salt_3000.bb => salt_3001.bb} (97%)
>
> diff --git a/meta-openstack/recipes-support/salt/salt/set_python_location_hashbang.patch b/meta-openstack/recipes-support/salt/salt/set_python_location_hashbang.patch
> deleted file mode 100644
> index 76d6f41..0000000
> --- a/meta-openstack/recipes-support/salt/salt/set_python_location_hashbang.patch
> +++ /dev/null
> @@ -1,158 +0,0 @@
> -Upstream-Status: Pending
> -
> -# The Salt SysV scripts require that the process name of the salt
> -# components have the form "salt-<component>".
> -# The current python shebangs on the salt components scripts spwans
> -# processes that are generically named python. Changed shebang so
> -# process names will be identifiable by the init scripts.
> -
> -diff --git a/scripts/salt b/scripts/salt
> -index 1a6d6b4d0c..0408ad07b2 100755
> ---- a/scripts/salt
> -+++ b/scripts/salt
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - '''
> - Publish commands to the salt system from the command line on the master.
> - '''
> -diff --git a/scripts/salt-api b/scripts/salt-api
> -index 6f028bacb6..7a51117822 100755
> ---- a/scripts/salt-api
> -+++ b/scripts/salt-api
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> -
> - # Import salt libs
> - from salt.scripts import salt_api
> -diff --git a/scripts/salt-call b/scripts/salt-call
> -index 5b8a8f3935..9ddda9428d 100755
> ---- a/scripts/salt-call
> -+++ b/scripts/salt-call
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - '''
> - Directly call a salt command in the modules, does not require a running salt
> - minion to run.
> -diff --git a/scripts/salt-cloud b/scripts/salt-cloud
> -index e977b68179..01c593881c 100755
> ---- a/scripts/salt-cloud
> -+++ b/scripts/salt-cloud
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - '''
> - Publish commands to the salt system from the command line on the master.
> - '''
> -diff --git a/scripts/salt-cp b/scripts/salt-cp
> -index 3da660d137..dcc3f11554 100755
> ---- a/scripts/salt-cp
> -+++ b/scripts/salt-cp
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - '''
> - Publish commands to the salt system from the command line on the master.
> - '''
> -diff --git a/scripts/salt-extend b/scripts/salt-extend
> -index 5385a7b6a9..b01c584bb4 100755
> ---- a/scripts/salt-extend
> -+++ b/scripts/salt-extend
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - '''
> - Quickstart for creating an/or extending the functionality of your SaltStack installation
> -
> -diff --git a/scripts/salt-key b/scripts/salt-key
> -index cb26dfd5a6..596b202a3f 100755
> ---- a/scripts/salt-key
> -+++ b/scripts/salt-key
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - '''
> - Manage the authentication keys with salt-key
> - '''
> -diff --git a/scripts/salt-master b/scripts/salt-master
> -index b4323bd532..52bb47dc47 100755
> ---- a/scripts/salt-master
> -+++ b/scripts/salt-master
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - '''
> - Start the salt-master
> - '''
> -diff --git a/scripts/salt-minion b/scripts/salt-minion
> -index 74a9fa1d67..4a23ed9122 100755
> ---- a/scripts/salt-minion
> -+++ b/scripts/salt-minion
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - '''
> - This script is used to kick off a salt minion daemon
> - '''
> -diff --git a/scripts/salt-proxy b/scripts/salt-proxy
> -index e921e6590b..443774ef85 100755
> ---- a/scripts/salt-proxy
> -+++ b/scripts/salt-proxy
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - # -*- coding: utf-8 -*-
> - '''
> - This script is used to kick off a salt proxy minion daemon
> -diff --git a/scripts/salt-run b/scripts/salt-run
> -index 2b2d86554c..cfef160ab0 100755
> ---- a/scripts/salt-run
> -+++ b/scripts/salt-run
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - '''
> - Execute a salt convenience routine
> - '''
> -diff --git a/scripts/salt-ssh b/scripts/salt-ssh
> -index 4f21baa5f4..77bb6ceb38 100755
> ---- a/scripts/salt-ssh
> -+++ b/scripts/salt-ssh
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - '''
> - Execute the salt ssh system
> - '''
> -diff --git a/scripts/salt-syndic b/scripts/salt-syndic
> -index d6faf2df63..896bf5f3b0 100755
> ---- a/scripts/salt-syndic
> -+++ b/scripts/salt-syndic
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - '''
> - This script is used to kick off a salt syndic daemon
> - '''
> -diff --git a/scripts/salt-unity b/scripts/salt-unity
> -index b0a2d31597..ff1fa9034c 100755
> ---- a/scripts/salt-unity
> -+++ b/scripts/salt-unity
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> -
> - from salt.scripts import salt_unity
> -
> -diff --git a/scripts/spm b/scripts/spm
> -index 027864ee11..4d9b648b5d 100755
> ---- a/scripts/spm
> -+++ b/scripts/spm
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - '''
> - Publish commands to the salt system from the command line on the master.
> -
> diff --git a/meta-openstack/recipes-support/salt/salt_3000.bb b/meta-openstack/recipes-support/salt/salt_3001.bb
> similarity index 97%
> rename from meta-openstack/recipes-support/salt/salt_3000.bb
> rename to meta-openstack/recipes-support/salt/salt_3001.bb
> index c2bc8da..5140470 100644
> --- a/meta-openstack/recipes-support/salt/salt_3000.bb
> +++ b/meta-openstack/recipes-support/salt/salt_3001.bb
> @@ -19,11 +19,10 @@ PACKAGECONFIG[zeromq] = ",,python3-pyzmq python3-pycrypto,"
>  PACKAGECONFIG[tcp] = ",,python3-pycrypto"
>
>  SRC_URI = "https://files.pythonhosted.org/packages/source/s/${PN}/${PN}-${PV}.tar.gz \
> -           file://set_python_location_hashbang.patch \
>  "
>
> -SRC_URI[md5sum] = "8084ef6f2a275b627ae364b9d562b4ff"
> -SRC_URI[sha256sum] = "04fbc64933b375cbbefc9576bcc65167b74d5eec7f58e64d096d67529ea66500"
> +SRC_URI[md5sum] = "ae06cef7557e237a954491a069e79a25"
> +SRC_URI[sha256sum] = "5ca60d1b2cc8e63db50995bd8b117914eeaf57c48ce2b3a3731ee57163adf154"
>
>
>  SYSTEMD_AUTO_ENABLE_${PN}-master = "disable"
> @@ -100,7 +99,7 @@ SUMMARY_${PN}-common = "shared libraries that salt requires for all packages"
>  DESCRIPTION_${PN}-common ="${DESCRIPTION_COMMON} This particular package provides shared libraries that \
>  salt-master, salt-minion, and salt-syndic require to function."
>  RDEPENDS_${PN}-common = "python3-dateutil python3-jinja2 python3-pyyaml python3-requests (>= 1.0.0)"
> -RRECOMMENDS_${PN}-common = "lsb"
> +RRECOMMENDS_${PN}-common = "lsb-release"
>  RSUGGESTS_${PN}-common = "python3-mako python3-git"
>  RCONFLICTS_${PN}-common = "python3-mako (< 0.7.0)"
>  CONFFILES_${PN}-common="${sysconfdir}/logrotate.d/${PN}"
> --
> 2.27.0
>
> I wasn't sure on the RRECOMMENDS for lsb since it was removed and lsb-release was created in it's place.
> 



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
