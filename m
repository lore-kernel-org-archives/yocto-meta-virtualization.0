Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.3503.1603855498922407692
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 20:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EPsTFOGg;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id 188so3363355qkk.12
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Oct 2020 20:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=hOfrzLpg0uzxUInrzC/e/l6dbeGBtn0SeosAwnfy+IE=;
        b=EPsTFOGgGXJfzkq3AR4SBWp5eSRFAr+dHToV2gMQrlXIJUMSbgVgd4V+oTSnK0EO/p
         7XSZGr/GYHHDGZCinVebPwx8+nkZatxN8UUQD40sLhG1F4u+5idKrA5hagN2WM+swhQY
         rtFHLyed83msw285VQ/igiwzsqyD6UCOsAXMLd/5PvUSdB3U6SExfWYQW4IO7X35vapn
         4nbJiK7Bd2foE7boefDNpDrwaVhW88ad64emLQwDyNrtuUkpdzu92XZlOdPjdlPV1Y3g
         K7ohdKnnSDOotlMzNGUH1d1yKjMDR9LN+qhLTzeydSGyyI/Cj0XHjl/nVNNNmCJ9gxYH
         gh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hOfrzLpg0uzxUInrzC/e/l6dbeGBtn0SeosAwnfy+IE=;
        b=NoJa3UrAsydp3z5lIaAa2xVDZJ0QwvDaC+a0rjzBFETzdeMb1VsmmyjX0jp6Kft4SN
         ob9/wK6amjOg2Mat1e37dCWQHGx7G3k57rY4wEzUuwP/R2734TOf4xfN56btGBnxpan+
         CE9cmWy0YVk7PQuxASuYVveZr892ObhajTCLHwpzkS85x4lxX00DWwYpU1AQM7nhjh1i
         SPL6x03wvhwZ9I+7KhpRK2Tf8xc6o71BQJqzgTOJC0MhDXR2zq7FFc3ZqxYvafy66TC0
         vwS5gRbdAyHAVkTBMTOx5TtIb/JtSQz8QJSljAt+wprOGnb9ze+1ze6NTqjuD0gQ6724
         jiLA==
X-Gm-Message-State: AOAM530K0hJLfHS9IRXABYrd9JLxgfDSHY/4EsgrdHHZacqGxzHR2Dd7
	giS9L/WTVOh3hYXHu5UJbCE=
X-Google-Smtp-Source: ABdhPJwmwhJQNOyGKIGz2TqygantDD5CZpHpEnU1Ql0TXhLeC6V5Mrd0GHAYhDpz0UFUQrGfqz/V4g==
X-Received: by 2002:a05:620a:2232:: with SMTP id n18mr5379983qkh.331.1603855497972;
        Tue, 27 Oct 2020 20:24:57 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id m12sm2297256qtu.52.2020.10.27.20.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 20:24:57 -0700 (PDT)
Date: Tue, 27 Oct 2020 23:24:55 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] openvswitch: use /run instead of /var/run in systemd service file
Message-ID: <20201028032452.GA46045@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201019072442.25583-1-Qi.Chen@windriver.com>
 <20201019073011.23528-1-Qi.Chen@windriver.com>
 <20201020065928.19256-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

thanks!

These are all merged.

Bruce


In message: [meta-virtualization][PATCH] openvswitch: use /run instead of /var/run in systemd service file
on 20/10/2020 Chen Qi wrote:

> /var/run has been deprecated by systemd, so use /run instead,
> as suggested by systemd.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...tead-of-var-run-for-in-systemd-units.patch | 102 ++++++++++++++++++
>  .../openvswitch/openvswitch_git.bb            |   1 +
>  2 files changed, 103 insertions(+)
>  create mode 100644 recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch
> 
> diff --git a/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch b/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch
> new file mode 100644
> index 0000000..244a216
> --- /dev/null
> +++ b/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch
> @@ -0,0 +1,102 @@
> +From ea98129777784b0e750a20078f01093dbdbe7b9b Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 20 Oct 2020 14:14:06 +0800
> +Subject: [PATCH] ovs: use /run instead of /var/run for in systemd units
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + rhel/etc_logrotate.d_openvswitch                            | 4 ++--
> + rhel/usr_lib_systemd_system_openvswitch-ipsec.service       | 2 +-
> + ...sr_lib_systemd_system_ovs-delete-transient-ports.service | 2 +-
> + rhel/usr_lib_systemd_system_ovs-vswitchd.service.in         | 6 +++---
> + rhel/usr_lib_systemd_system_ovsdb-server.service            | 6 +++---
> + 5 files changed, 10 insertions(+), 10 deletions(-)
> +
> +diff --git a/rhel/etc_logrotate.d_openvswitch b/rhel/etc_logrotate.d_openvswitch
> +index f4302ffbc..c0f476744 100644
> +--- a/rhel/etc_logrotate.d_openvswitch
> ++++ b/rhel/etc_logrotate.d_openvswitch
> +@@ -13,8 +13,8 @@
> +     missingok
> +     postrotate
> +         # Tell Open vSwitch daemons to reopen their log files
> +-        if [ -d /var/run/openvswitch ]; then
> +-            for ctl in /var/run/openvswitch/*.ctl; do
> ++        if [ -d /run/openvswitch ]; then
> ++            for ctl in /run/openvswitch/*.ctl; do
> +                 ovs-appctl -t "$ctl" vlog/reopen 2>/dev/null || :
> +             done
> +         fi
> +diff --git a/rhel/usr_lib_systemd_system_openvswitch-ipsec.service b/rhel/usr_lib_systemd_system_openvswitch-ipsec.service
> +index d8f47af68..92dad44f9 100644
> +--- a/rhel/usr_lib_systemd_system_openvswitch-ipsec.service
> ++++ b/rhel/usr_lib_systemd_system_openvswitch-ipsec.service
> +@@ -5,7 +5,7 @@ After=openvswitch.service
> + 
> + [Service]
> + Type=forking
> +-PIDFile=/var/run/openvswitch/ovs-monitor-ipsec.pid
> ++PIDFile=/run/openvswitch/ovs-monitor-ipsec.pid
> + ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
> +                     --ike-daemon=libreswan start-ovs-ipsec
> + ExecStop=/usr/share/openvswitch/scripts/ovs-ctl stop-ovs-ipsec
> +diff --git a/rhel/usr_lib_systemd_system_ovs-delete-transient-ports.service b/rhel/usr_lib_systemd_system_ovs-delete-transient-ports.service
> +index 4cd4d7f57..d4d7b204b 100644
> +--- a/rhel/usr_lib_systemd_system_ovs-delete-transient-ports.service
> ++++ b/rhel/usr_lib_systemd_system_ovs-delete-transient-ports.service
> +@@ -2,7 +2,7 @@
> + Description=Open vSwitch Delete Transient Ports
> + After=ovsdb-server.service
> + Before=ovs-vswitchd.service
> +-AssertPathExists=/var/run/openvswitch/db.sock
> ++AssertPathExists=/run/openvswitch/db.sock
> + 
> + [Service]
> + Type=oneshot
> +diff --git a/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in b/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
> +index f88b57cae..82748bf2d 100644
> +--- a/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
> ++++ b/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
> +@@ -4,14 +4,14 @@ After=ovsdb-server.service network-pre.target systemd-udev-settle.service
> + Before=network.target network.service
> + Requires=ovsdb-server.service
> + ReloadPropagatedFrom=ovsdb-server.service
> +-AssertPathIsReadWrite=/var/run/openvswitch/db.sock
> ++AssertPathIsReadWrite=/run/openvswitch/db.sock
> + PartOf=openvswitch.service
> + 
> + [Service]
> + Type=forking
> +-PIDFile=/var/run/openvswitch/ovs-vswitchd.pid
> ++PIDFile=/run/openvswitch/ovs-vswitchd.pid
> + Restart=on-failure
> +-Environment=XDG_RUNTIME_DIR=/var/run/openvswitch
> ++Environment=XDG_RUNTIME_DIR=/run/openvswitch
> + EnvironmentFile=/etc/openvswitch/default.conf
> + EnvironmentFile=-/etc/sysconfig/openvswitch
> + EnvironmentFile=-/run/openvswitch.useropts
> +diff --git a/rhel/usr_lib_systemd_system_ovsdb-server.service b/rhel/usr_lib_systemd_system_ovsdb-server.service
> +index 69b0bf61a..5f83f281f 100644
> +--- a/rhel/usr_lib_systemd_system_ovsdb-server.service
> ++++ b/rhel/usr_lib_systemd_system_ovsdb-server.service
> +@@ -7,12 +7,12 @@ PartOf=openvswitch.service
> + 
> + [Service]
> + Type=forking
> +-PIDFile=/var/run/openvswitch/ovsdb-server.pid
> ++PIDFile=/run/openvswitch/ovsdb-server.pid
> + Restart=on-failure
> + EnvironmentFile=/etc/openvswitch/default.conf
> + EnvironmentFile=-/etc/sysconfig/openvswitch
> +-ExecStartPre=-/bin/mkdir /var/run/openvswitch /var/log/openvswitch
> +-ExecStartPre=-/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
> ++ExecStartPre=-/bin/mkdir /run/openvswitch /var/log/openvswitch
> ++ExecStartPre=-/bin/chown ${OVS_USER_ID} /run/openvswitch /var/log/openvswitch
> + ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch.useropts; /bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
> + ExecStartPre=/bin/sh -c 'if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /bin/echo "OVS_USER_OPT=--ovs-user=${OVS_USER_ID}" >> /run/openvswitch.useropts; fi'
> + EnvironmentFile=-/run/openvswitch.useropts
> +-- 
> +2.17.1
> +
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 07258be..fa1ec4d 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -31,6 +31,7 @@ SRC_URI = "file://openvswitch-switch \
>             file://python-switch-remaining-scripts-to-use-python3.patch \
>             file://systemd-update-tool-paths.patch \
>             file://systemd-create-runtime-dirs.patch \
> +           file://0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch \
>             "
>  
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
> -- 
> 2.17.1
> 

> 
> 
> 


