Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCEECD1284
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 14:09:21 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.137272.1712671756441355611
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Apr 2024 07:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WIQAmkju;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6ed04c91c46so3785822b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Apr 2024 07:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712671756; x=1713276556; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LbnwK0hlXv55U6BWcBezCXtJBurJLcAEiR1UMdwvkb0=;
        b=WIQAmkjuRjLjESWkg1aVtZ1u8XqpAwPNoYHzOV0zruSYiLIfQ7s4TgWFR0WrspnP6V
         v/e4NYvBdedbuGijlbT3w/2BO7TPouNJFXTWs1cUaJfLPzhMtzLd/SZdz0Hc8AOAc1oM
         U9Ow2BKaYQXLKu5Ny0u2nxktd+AllJLNS3N7D7ppCms1FMI0o1e2WXIxOdnL+FN76OEU
         TIr/5MBqhrs1iKEVKi5tzRhgg8X4HNbnLx+ZMmp0VG03uLMDfA6noEzkwAKUX702IHcu
         GfL6x5tLP4aYQ6BSFbLnt4ojkntagEiu9UW+oNlepMYwJQMC8hU/XMyM2Dy47EAMXlsc
         45QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712671756; x=1713276556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbnwK0hlXv55U6BWcBezCXtJBurJLcAEiR1UMdwvkb0=;
        b=ec2QmjtpLOZ+OjGWSyH+0WhICQ7jMfhhgMvPxCaSWX3L54gAIo7IJnRG8jaKPPfIBk
         jVQoISfr7zKxEIrxMBR2Ef3oenDhZoafdzeEKHtTo6Eoh1eVsC/+PkdJNpjKZFNjzcG9
         KQ4rI4tlIEf3kAMnu9W69Vptw2/5iGo+tfXcQ0T3eXyPEXNH4jsDa0jQ3Pekq/mC8OyI
         L9o8UyoyziH3WffjFAzNn0zlqhLcUNf6LMH7VOW9X3sAqPR1IE3yKfyyUKa+j3CrOZJA
         oICVw/ms7o0bxP43Zu71W2670S50N5fWVPCg1yeyUjsZZ741xP/ip3O4YHuDr6b0LLvy
         17nw==
X-Gm-Message-State: AOJu0YxKqYktPGu/RIEXEcf6OB+QzvNE5582VYFs0Drty294K4rkhagu
	PngIuqixvv+Itv5An6/haPTVMIQ03nUre3Fe3WBzC6QsMsV0fkpLz0aOPc6Rhig3asKdoa3CSN8
	0lHkz58li6jvUzhPiPp3HPt6gpjfyeC3z
X-Google-Smtp-Source: AGHT+IFzRi+2LqMVOXde2HXbTM5sAEMQSTt2aV/oe47UVrvxOwLa3UIcBshwlVYuXPe2DVhK0F46S3PWXm8aq4X9Yws=
X-Received: by 2002:a17:90b:344d:b0:2a5:36b0:8c3c with SMTP id
 lj13-20020a17090b344d00b002a536b08c3cmr5102361pjb.29.1712671755641; Tue, 09
 Apr 2024 07:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240326094258.1138548-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20240326094258.1138548-1-xiangyu.chen@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Apr 2024 10:09:04 -0400
Message-ID: <CADkTA4Oe71dQ101iLaP5hqgz99cEkJFqozZ5MSnqM53XJyFquQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] lxc: fix broken test cases
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009cae570615aa77e0"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Apr 2024 14:09:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8668

--0000000000009cae570615aa77e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged to master-next (which should become master tomorrow, or later today)=
.

Bruce

On Tue, Mar 26, 2024 at 5:03=E2=80=AFAM Xiangyu Chen <xiangyu.chen@eng.wind=
river.com>
wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Upstream dropped cgroup handling in lxc-test-usernic lxc-test-unpriv and
> lxc-test-apparmor-mount to fix the broken cases.
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  ...xc-test-usernic-drop-cgroup-handling.patch |  61 +++++++++++
>  ...-and-broken-cgroup-handling-code-fro.patch | 103 ++++++++++++++++++
>  recipes-containers/lxc/lxc_git.bb             |   2 +
>  3 files changed, 166 insertions(+)
>  create mode 100644
> recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handling.p=
atch
>  create mode 100644
> recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-hand=
ling-code-fro.patch
>
> diff --git
> a/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handling=
.patch
> b/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handling=
.patch
> new file mode 100644
> index 00000000..162e8f9d
> --- /dev/null
> +++
> b/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handling=
.patch
> @@ -0,0 +1,61 @@
> +From ec85e5ca4953292c4341497704ce738669a79b64 Mon Sep 17 00:00:00 2001
> +From: Serge Hallyn <serge@hallyn.com>
> +Date: Fri, 2 Feb 2024 10:41:11 -0600
> +Subject: [PATCH] lxc-test-usernic: drop cgroup handling
> +
> +This stuff is not needed in a modern systemd based system, and in fact
> +breaks.  It would probably be better to detect such a system so that a
> +non-systemd box can still run this test.  But I'm not sure what would be
> +reliable.
> +
> +Upstream-Status: Backport from
> +[
> https://github.com/lxc/lxc/commit/ec85e5ca4953292c4341497704ce738669a79b6=
4
> ]
> +
> +Signed-off-by: Serge Hallyn <serge@hallyn.com>
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + src/tests/lxc-test-usernic.in | 28 ----------------------------
> + 1 file changed, 28 deletions(-)
> +
> +diff --git a/src/tests/lxc-test-usernic.in b/src/tests/
> lxc-test-usernic.in
> +index 9af8678f3..49fd5e3f7 100755
> +--- a/src/tests/lxc-test-usernic.in
> ++++ b/src/tests/lxc-test-usernic.in
> +@@ -80,34 +80,6 @@ lxc.idmap =3D u 0 910000 10000
> + lxc.idmap =3D g 0 910000 10000
> + EOF
> +
> +-if command -v cgm >/dev/null 2>&1; then
> +-      cgm create all usernic-user
> +-      cgm chown all usernic-user $(id -u usernic-user) $(id -g
> usernic-user)
> +-      cgm movepid all usernic-user $$
> +-elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
> +-      for d in $(cut -d : -f 2 /proc/self/cgroup); do
> +-              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> +-                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.Create \
> +-                      string:$d string:usernic-user >/dev/null
> +-
> +-              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> +-                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.Chown \
> +-                      string:$d string:usernic-user int32:$(id -u
> usernic-user) int32:$(id -g usernic-user) >/dev/null
> +-
> +-              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> +-                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.MovePid \
> +-                      string:$d string:usernic-user int32:$$ >/dev/null
> +-      done
> +-else
> +-      for d in /sys/fs/cgroup/*; do
> +-              [ "$d" =3D "/sys/fs/cgroup/unified" ] && continue
> +-              [ -f $d/cgroup.clone_children ] && echo 1 >
> $d/cgroup.clone_children
> +-              [ ! -d $d/lxctest ] && mkdir $d/lxctest
> +-              chown -R usernic-user: $d/lxctest
> +-              echo $$ > $d/lxctest/tasks
> +-      done
> +-fi
> +-
> + mkdir -p /run/user/$(id -u usernic-user)
> + chown -R usernic-user: /run/user/$(id -u usernic-user) /home/usernic-us=
er
> +
> +--
> +2.35.5
> +
> diff --git
> a/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-ha=
ndling-code-fro.patch
> b/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-ha=
ndling-code-fro.patch
> new file mode 100644
> index 00000000..bf8df795
> --- /dev/null
> +++
> b/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-ha=
ndling-code-fro.patch
> @@ -0,0 +1,103 @@
> +From 8f9733d756361ff8f8d8d589f286c0e064b1195d Mon Sep 17 00:00:00 2001
> +From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
> +Date: Thu, 15 Feb 2024 18:13:05 +0100
> +Subject: [PATCH] tests: remove old and broken cgroup handling code from
> tests
> +
> +We have removed the same piece of code in
> +ec85e5ca495 ("lxc-test-usernic: drop cgroup handling")
> +let's do the same for two other tests.
> +
> +This fixes autopkgtests.
> +
> +Upstream-Status: Backport from
> +[
> https://github.com/lxc/lxc/commit/8f9733d756361ff8f8d8d589f286c0e064b1195=
d
> ]
> +
> +Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.co=
m
> >
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + src/tests/lxc-test-apparmor-mount | 29 -----------------------------
> + src/tests/lxc-test-unpriv         | 28 ----------------------------
> + 2 files changed, 57 deletions(-)
> +
> +diff --git a/src/tests/lxc-test-apparmor-mount
> b/src/tests/lxc-test-apparmor-mount
> +index 7c9d9ad50..ddf783d4b 100755
> +--- a/src/tests/lxc-test-apparmor-mount
> ++++ b/src/tests/lxc-test-apparmor-mount
> +@@ -119,35 +119,6 @@ chown -R $TUSER: /run/user/$(id -u $TUSER)
> +
> + cd $HDIR
> +
> +-if command -v cgm >/dev/null 2>&1; then
> +-      cgm create all $TUSER
> +-      cgm chown all $TUSER $(id -u $TUSER) $(id -g $TUSER)
> +-      cgm movepid all $TUSER $$
> +-elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
> +-      for d in $(cut -d : -f 2 /proc/self/cgroup); do
> +-              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> +-                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.Create \
> +-                      string:$d string:$TUSER >/dev/null
> +-
> +-              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> +-                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.Chown \
> +-                      string:$d string:$TUSER int32:$(id -u $TUSER)
> int32:$(id -g $TUSER) >/dev/null
> +-
> +-              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> +-                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.MovePid \
> +-                      string:$d string:$TUSER int32:$$ >/dev/null
> +-      done
> +-else
> +-      for d in /sys/fs/cgroup/*; do
> +-              [ "$d" =3D "/sys/fs/cgroup/unified" ] && continue
> +-              [ -f $d/cgroup.clone_children ] && echo 1 >
> $d/cgroup.clone_children
> +-              [ ! -d $d/lxctest ] && mkdir $d/lxctest
> +-              chown -R $TUSER: $d/lxctest
> +-              echo $$ > $d/lxctest/tasks
> +-      done
> +-fi
> +-
> +-
> + run_cmd lxc-create -t busybox -n $cname
> +
> + echo "test default confined container"
> +diff --git a/src/tests/lxc-test-unpriv b/src/tests/lxc-test-unpriv
> +index 8fb9106d6..426add9da 100755
> +--- a/src/tests/lxc-test-unpriv
> ++++ b/src/tests/lxc-test-unpriv
> +@@ -130,34 +130,6 @@ chown -R $TUSER: /run/user/$(id -u $TUSER)
> +
> + cd $HDIR
> +
> +-if command -v cgm >/dev/null 2>&1; then
> +-      cgm create all $TUSER
> +-      cgm chown all $TUSER $(id -u $TUSER) $(id -g $TUSER)
> +-      cgm movepid all $TUSER $$
> +-elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
> +-      for d in $(cut -d : -f 2 /proc/self/cgroup); do
> +-              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> +-                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.Create \
> +-                      string:$d string:$TUSER >/dev/null
> +-
> +-              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> +-                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.Chown \
> +-                      string:$d string:$TUSER int32:$(id -u $TUSER)
> int32:$(id -g $TUSER) >/dev/null
> +-
> +-              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> +-                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.MovePid \
> +-                      string:$d string:$TUSER int32:$$ >/dev/null
> +-      done
> +-else
> +-      for d in /sys/fs/cgroup/*; do
> +-              [ "$d" =3D "/sys/fs/cgroup/unified" ] && continue
> +-              [ -f $d/cgroup.clone_children ] && echo 1 >
> $d/cgroup.clone_children
> +-              [ ! -d $d/lxctest ] && mkdir $d/lxctest
> +-              chown -R $TUSER: $d/lxctest
> +-              echo $$ > $d/lxctest/tasks
> +-      done
> +-fi
> +-
> + run_cmd lxc-create -t busybox -n c1 -l trace -o "${UNPRIV_LOG}"
> +
> + # Make sure we can start it - twice
> +--
> +2.35.5
> +
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/
> lxc_git.bb
> index 33ea4ee7..ee0e442f 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -47,6 +47,8 @@ SRC_URI =3D "git://
> github.com/lxc/lxc.git;branch=3Dstable-5.0;protocol=3Dhttps \
>
> file://0001-template-if-busybox-contains-init-use-it-in-containe.patch \
>         file://dnsmasq.conf \
>         file://lxc-net \
> +       file://0001-lxc-test-usernic-drop-cgroup-handling.patch \
> +
>  file://0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch \
>         "
>
>  SRCREV =3D "cb8e38aca27a23964941f0f011a8919aab8bebab"
> --
> 2.35.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8656):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8656
> Mute This Topic: https://lists.yoctoproject.org/mt/105154916/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009cae570615aa77e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged to master-next (which should become master tomorrow, or later today).</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 26,=
 2024 at 5:03=E2=80=AFAM Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@en=
g.windriver.com">xiangyu.chen@eng.windriver.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">From: Xiangyu Chen &lt;<a hr=
ef=3D"mailto:xiangyu.chen@windriver.com" target=3D"_blank">xiangyu.chen@win=
driver.com</a>&gt;<br>
<br>
Upstream dropped cgroup handling in lxc-test-usernic lxc-test-unpriv and<br=
>
lxc-test-apparmor-mount to fix the broken cases.<br>
<br>
Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.co=
m" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0...xc-test-usernic-drop-cgroup-handling.patch |=C2=A0 61 +++++++++++<=
br>
=C2=A0...-and-broken-cgroup-handling-code-fro.patch | 103 +++++++++++++++++=
+<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r" target=3D"_blank">lxc_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A03 files changed, 166 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/lxc/files/0001-lxc-test-usernic=
-drop-cgroup-handling.patch<br>
=C2=A0create mode 100644 recipes-containers/lxc/files/0001-tests-remove-old=
-and-broken-cgroup-handling-code-fro.patch<br>
<br>
diff --git a/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup=
-handling.patch b/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-c=
group-handling.patch<br>
new file mode 100644<br>
index 00000000..162e8f9d<br>
--- /dev/null<br>
+++ b/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handli=
ng.patch<br>
@@ -0,0 +1,61 @@<br>
+From ec85e5ca4953292c4341497704ce738669a79b64 Mon Sep 17 00:00:00 2001<br>
+From: Serge Hallyn &lt;<a href=3D"mailto:serge@hallyn.com" target=3D"_blan=
k">serge@hallyn.com</a>&gt;<br>
+Date: Fri, 2 Feb 2024 10:41:11 -0600<br>
+Subject: [PATCH] lxc-test-usernic: drop cgroup handling<br>
+<br>
+This stuff is not needed in a modern systemd based system, and in fact<br>
+breaks.=C2=A0 It would probably be better to detect such a system so that =
a<br>
+non-systemd box can still run this test.=C2=A0 But I&#39;m not sure what w=
ould be<br>
+reliable.<br>
+<br>
+Upstream-Status: Backport from<br>
+[<a href=3D"https://github.com/lxc/lxc/commit/ec85e5ca4953292c4341497704ce=
738669a79b64" rel=3D"noreferrer" target=3D"_blank">https://github.com/lxc/l=
xc/commit/ec85e5ca4953292c4341497704ce738669a79b64</a>]<br>
+<br>
+Signed-off-by: Serge Hallyn &lt;<a href=3D"mailto:serge@hallyn.com" target=
=3D"_blank">serge@hallyn.com</a>&gt;<br>
+Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.c=
om" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
+---<br>
+ src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"noreferrer" targe=
t=3D"_blank">lxc-test-usernic.in</a> | 28 ----------------------------<br>
+ 1 file changed, 28 deletions(-)<br>
+<br>
+diff --git a/src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"noref=
errer" target=3D"_blank">lxc-test-usernic.in</a> b/src/tests/<a href=3D"htt=
p://lxc-test-usernic.in" rel=3D"noreferrer" target=3D"_blank">lxc-test-user=
nic.in</a><br>
+index 9af8678f3..49fd5e3f7 100755<br>
+--- a/src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"noreferrer" =
target=3D"_blank">lxc-test-usernic.in</a><br>
++++ b/src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"noreferrer" =
target=3D"_blank">lxc-test-usernic.in</a><br>
+@@ -80,34 +80,6 @@ lxc.idmap =3D u 0 910000 10000<br>
+ lxc.idmap =3D g 0 910000 10000<br>
+ EOF<br>
+ <br>
+-if command -v cgm &gt;/dev/null 2&gt;&amp;1; then<br>
+-=C2=A0 =C2=A0 =C2=A0 cgm create all usernic-user<br>
+-=C2=A0 =C2=A0 =C2=A0 cgm chown all usernic-user $(id -u usernic-user) $(i=
d -g usernic-user)<br>
+-=C2=A0 =C2=A0 =C2=A0 cgm movepid all usernic-user $$<br>
+-elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 for d in $(cut -d : -f 2 /proc/self/cgroup); do<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.Create \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:usernic-user &gt;/dev/null<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.Chown \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:usernic-user int32:$(id -u usernic-user) int32:$(id -g=
 usernic-user) &gt;/dev/null<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.MovePid \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:usernic-user int32:$$ &gt;/dev/null<br>
+-=C2=A0 =C2=A0 =C2=A0 done<br>
+-else<br>
+-=C2=A0 =C2=A0 =C2=A0 for d in /sys/fs/cgroup/*; do<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;$d&quot; =3D &qu=
ot;/sys/fs/cgroup/unified&quot; ] &amp;&amp; continue<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -f $d/cgroup.clone_chi=
ldren ] &amp;&amp; echo 1 &gt; $d/cgroup.clone_children<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ ! -d $d/lxctest ] &amp=
;&amp; mkdir $d/lxctest<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chown -R usernic-user: $=
d/lxctest<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo $$ &gt; $d/lxctest/=
tasks<br>
+-=C2=A0 =C2=A0 =C2=A0 done<br>
+-fi<br>
+-<br>
+ mkdir -p /run/user/$(id -u usernic-user)<br>
+ chown -R usernic-user: /run/user/$(id -u usernic-user) /home/usernic-user=
<br>
+ <br>
+-- <br>
+2.35.5<br>
+<br>
diff --git a/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-=
cgroup-handling-code-fro.patch b/recipes-containers/lxc/files/0001-tests-re=
move-old-and-broken-cgroup-handling-code-fro.patch<br>
new file mode 100644<br>
index 00000000..bf8df795<br>
--- /dev/null<br>
+++ b/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-=
handling-code-fro.patch<br>
@@ -0,0 +1,103 @@<br>
+From 8f9733d756361ff8f8d8d589f286c0e064b1195d Mon Sep 17 00:00:00 2001<br>
+From: Alexander Mikhalitsyn &lt;<a href=3D"mailto:aleksandr.mikhalitsyn@ca=
nonical.com" target=3D"_blank">aleksandr.mikhalitsyn@canonical.com</a>&gt;<=
br>
+Date: Thu, 15 Feb 2024 18:13:05 +0100<br>
+Subject: [PATCH] tests: remove old and broken cgroup handling code from te=
sts<br>
+<br>
+We have removed the same piece of code in<br>
+ec85e5ca495 (&quot;lxc-test-usernic: drop cgroup handling&quot;)<br>
+let&#39;s do the same for two other tests.<br>
+<br>
+This fixes autopkgtests.<br>
+<br>
+Upstream-Status: Backport from<br>
+[<a href=3D"https://github.com/lxc/lxc/commit/8f9733d756361ff8f8d8d589f286=
c0e064b1195d" rel=3D"noreferrer" target=3D"_blank">https://github.com/lxc/l=
xc/commit/8f9733d756361ff8f8d8d589f286c0e064b1195d</a>]<br>
+<br>
+Signed-off-by: Alexander Mikhalitsyn &lt;<a href=3D"mailto:aleksandr.mikha=
litsyn@canonical.com" target=3D"_blank">aleksandr.mikhalitsyn@canonical.com=
</a>&gt;<br>
+Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.c=
om" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
+---<br>
+ src/tests/lxc-test-apparmor-mount | 29 -----------------------------<br>
+ src/tests/lxc-test-unpriv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 28 ---------=
-------------------<br>
+ 2 files changed, 57 deletions(-)<br>
+<br>
+diff --git a/src/tests/lxc-test-apparmor-mount b/src/tests/lxc-test-apparm=
or-mount<br>
+index 7c9d9ad50..ddf783d4b 100755<br>
+--- a/src/tests/lxc-test-apparmor-mount<br>
++++ b/src/tests/lxc-test-apparmor-mount<br>
+@@ -119,35 +119,6 @@ chown -R $TUSER: /run/user/$(id -u $TUSER)<br>
+ <br>
+ cd $HDIR<br>
+ <br>
+-if command -v cgm &gt;/dev/null 2&gt;&amp;1; then<br>
+-=C2=A0 =C2=A0 =C2=A0 cgm create all $TUSER<br>
+-=C2=A0 =C2=A0 =C2=A0 cgm chown all $TUSER $(id -u $TUSER) $(id -g $TUSER)=
<br>
+-=C2=A0 =C2=A0 =C2=A0 cgm movepid all $TUSER $$<br>
+-elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 for d in $(cut -d : -f 2 /proc/self/cgroup); do<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.Create \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:$TUSER &gt;/dev/null<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.Chown \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:$TUSER int32:$(id -u $TUSER) int32:$(id -g $TUSER) &gt=
;/dev/null<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.MovePid \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:$TUSER int32:$$ &gt;/dev/null<br>
+-=C2=A0 =C2=A0 =C2=A0 done<br>
+-else<br>
+-=C2=A0 =C2=A0 =C2=A0 for d in /sys/fs/cgroup/*; do<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;$d&quot; =3D &qu=
ot;/sys/fs/cgroup/unified&quot; ] &amp;&amp; continue<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -f $d/cgroup.clone_chi=
ldren ] &amp;&amp; echo 1 &gt; $d/cgroup.clone_children<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ ! -d $d/lxctest ] &amp=
;&amp; mkdir $d/lxctest<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chown -R $TUSER: $d/lxct=
est<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo $$ &gt; $d/lxctest/=
tasks<br>
+-=C2=A0 =C2=A0 =C2=A0 done<br>
+-fi<br>
+-<br>
+-<br>
+ run_cmd lxc-create -t busybox -n $cname<br>
+ <br>
+ echo &quot;test default confined container&quot;<br>
+diff --git a/src/tests/lxc-test-unpriv b/src/tests/lxc-test-unpriv<br>
+index 8fb9106d6..426add9da 100755<br>
+--- a/src/tests/lxc-test-unpriv<br>
++++ b/src/tests/lxc-test-unpriv<br>
+@@ -130,34 +130,6 @@ chown -R $TUSER: /run/user/$(id -u $TUSER)<br>
+ <br>
+ cd $HDIR<br>
+ <br>
+-if command -v cgm &gt;/dev/null 2&gt;&amp;1; then<br>
+-=C2=A0 =C2=A0 =C2=A0 cgm create all $TUSER<br>
+-=C2=A0 =C2=A0 =C2=A0 cgm chown all $TUSER $(id -u $TUSER) $(id -g $TUSER)=
<br>
+-=C2=A0 =C2=A0 =C2=A0 cgm movepid all $TUSER $$<br>
+-elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 for d in $(cut -d : -f 2 /proc/self/cgroup); do<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.Create \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:$TUSER &gt;/dev/null<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.Chown \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:$TUSER int32:$(id -u $TUSER) int32:$(id -g $TUSER) &gt=
;/dev/null<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.MovePid \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:$TUSER int32:$$ &gt;/dev/null<br>
+-=C2=A0 =C2=A0 =C2=A0 done<br>
+-else<br>
+-=C2=A0 =C2=A0 =C2=A0 for d in /sys/fs/cgroup/*; do<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;$d&quot; =3D &qu=
ot;/sys/fs/cgroup/unified&quot; ] &amp;&amp; continue<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -f $d/cgroup.clone_chi=
ldren ] &amp;&amp; echo 1 &gt; $d/cgroup.clone_children<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ ! -d $d/lxctest ] &amp=
;&amp; mkdir $d/lxctest<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chown -R $TUSER: $d/lxct=
est<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo $$ &gt; $d/lxctest/=
tasks<br>
+-=C2=A0 =C2=A0 =C2=A0 done<br>
+-fi<br>
+-<br>
+ run_cmd lxc-create -t busybox -n c1 -l trace -o &quot;${UNPRIV_LOG}&quot;=
<br>
+ <br>
+ # Make sure we can start it - twice<br>
+-- <br>
+2.35.5<br>
+<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"no=
referrer" target=3D"_blank">lxc_git.bb</a> b/recipes-containers/lxc/<a href=
=3D"http://lxc_git.bb" rel=3D"noreferrer" target=3D"_blank">lxc_git.bb</a><=
br>
index 33ea4ee7..ee0e442f 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r" target=3D"_blank">lxc_git.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r" target=3D"_blank">lxc_git.bb</a><br>
@@ -47,6 +47,8 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/lxc/=
lxc.git;branch=3Dstable-5.0;protocol=3Dhttps" rel=3D"noreferrer" target=3D"=
_blank">github.com/lxc/lxc.git;branch=3Dstable-5.0;protocol=3Dhttps</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-template-if-busybox-contains-init-u=
se-it-in-containe.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dnsmasq.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-net \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-lxc-test-usernic-drop-cgroup-handli=
ng.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tests-remove-old-and-broken-cgroup-=
handling-code-fro.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRCREV =3D &quot;cb8e38aca27a23964941f0f011a8919aab8bebab&quot;<br>
-- <br>
2.35.5<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8656): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8656" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8656</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105154916/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/105154916/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div>

--0000000000009cae570615aa77e0--

