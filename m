Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914C3C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 01:43:56 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2876.1783475026993934351
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jul 2026 18:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MYupJiJN;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so187786a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jul 2026 18:43:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783475026; cv=none;
        d=google.com; s=arc-20260327;
        b=L834zjd7m7kayYqWFEMZiKh4/9/ZAcx1aIN56Br9LU+Aj1UcwxOrRH8Tg1skuuHXnP
         PunEJ2t5U5wlxMpZw29AV0v1vQN2pBoRGuwRoMikVmLyQCIdbfrLqLnGb7Vtyjycdjft
         HpKs37lt0p1j2wWSnIN9RvlOeJQwsrh8IpaVbqUIPLx30rNhHWroIbvmNX760BAsNzPP
         37kFgxbAf9Qu1T4o8P0vTS608mk3uaTLsSSzWuWmDRMp00Fajdf1V0wBmOnxch7G74Ri
         ++WGbaCI+3rlFRw9KSugSaYqGbXAvg38OGXDR9EQ9JmFp+HxW1l5nK7kBcGMOoR2MMod
         /ACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=beqEVvihmCPt5N9Rh/TnCdhLIMi+ClOsrf2ZndgaCtE=;
        fh=RlXFC4EVqiP0gvru7+OOCjvgFbfzQ6di88zFfkgPMyQ=;
        b=UcsAQzLYMEWOZ0YbHeStOSbVF8nzcIAzXOaNIbeef5HnK4KaNT+RFFA77sTUDxCY6C
         qu1zkzDamd2irU3Mx3dnlnh9rpCTvxy13pT5cLGZFMXV5JykOwnYCnY66s9gCfFtLdGo
         cTqgjwO4GFpYH9auK3XJdisa2wOww1ZQcNTPNBuVaXGvFQi5TFC3S6W0YAnXjsG9h92N
         ZZQOJbgZIZ0nS8BDDuJmSDPkvTxo7G6vfj6DM9R+YCeVMRJczUsbWqhnBmdZoZIdJF0t
         /q17rUgNjFwyecNX0mW32jLj7ziMEgTWrQqJ9EMffgz1lctcN05NthvAbBURe6OZvzTc
         f6Mg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783475026; x=1784079826; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=beqEVvihmCPt5N9Rh/TnCdhLIMi+ClOsrf2ZndgaCtE=;
        b=MYupJiJNY+1+qXbUOLIP106d/U/Ey9ru4Ow0faEJ5ihUgOHn8XsGo6F8vi4Lieg2tr
         9h2zfqkSOSHYK+LerGE+KMYdBTPVoivKXt50xUZxwMtOOb/PaZ/zGY2LcX3lUCTAaJqX
         FJaI3TF3Mv4isSuDQW4XMKBzvM0ZiqyMLcqEEoqLlL22kQIuiNbD9hzL0Eusz0723xKd
         SKvO5slzSoJD35a3zeykUJk//tU59DbskJCKHbL8CVmlBUTEwkuZGevSkgR+iLmdA7AN
         G0fI6I2FzfWuGXmCT5D3NJ3yTXfaJbf0PEjevqyUohpyj2D/ynxbmo05makGx7guH+MH
         WYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783475026; x=1784079826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=beqEVvihmCPt5N9Rh/TnCdhLIMi+ClOsrf2ZndgaCtE=;
        b=Pn9TRDvo62fWWNOSq6my8a+x66k+zc7k+hDT0jUh8/08ZQUxnqNwH2JgMDeykta9eq
         vskADPVB/J9bEtw5DsRk92i4u4kr67r8B++11Rs/Ouw+k2pMAULuvfW5iAoMu3wHR1sl
         Nyz9RsYsdoowezJkaRDD82ZTfX90K5+Bco5QlbW2SkPg3oJ2DkhNlz/6LJDP9azB96Ys
         J5x8Z82J0hTPxfM55Z8KCEjozh3CctB85vrfUgXCFQcavobmPaufYzyUZJoZh1pkk0mm
         HLHVGYbgmFwNkncw1QguvsVuV1M4eWftrmS+uZc0XXZx9ZdtXo9NW+vrqrq3CFZsLgu2
         mXvw==
X-Gm-Message-State: AOJu0YyThVwcxwe5p6lwCVqKZhn/UpuC7Kq4jndm+o2cygspp/33J+T+
	UkVKa/bxctvbRWBV+oAMe1rsWSHOYUQcJGvZDT3xNfSJA8/K8Gy2wI0SWyicvJUUcVY7JYZt1Vt
	N7WEQiHeKdGivVUGaMzokA53KU0MTUyo=
X-Gm-Gg: AfdE7clkvanDj0UZBrrkBSY1voRf93207ia+Bgwd71dnI0UyYiIKLHyKa2dRktrIEtj
	xzEZa2flbEJRCbdOpTtngPfBjiq4g6zXhR9YbcSBF2BhF2m9xV5MwFZ5RPKabN3Ss8sRqWaIURW
	UzHv9g/JMDDLNsG+b5+plPF5H683VAsbqc3I1txA3NLyVyNQHlqK6PiwOtdDwVqBNk7lyvqPlt2
	j6JRPNq6Exc82XeqKskclWjsv86YQdbvS56ugKPmzPLCiblKw0tv0vnUNwTIKGkC8CdSfYZrPVf
	ADiGUn2C/k5tHNHw/KSVP9pUgLYKogt4LYrR71d4ryMHOsq+rhYy5xuGB1nafWjilTCoD3GoDNs
	br4uflD/Lb/jLuTM=
X-Received: by 2002:a17:90b:2691:b0:380:105f:8ffd with SMTP id
 98e67ed59e1d1-38940a1f20dmr407526a91.16.1783475026301; Tue, 07 Jul 2026
 18:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780104071.git.tim.orling@konsulko.com> <cover.1783356922.git.tim.orling@konsulko.com>
In-Reply-To: <cover.1783356922.git.tim.orling@konsulko.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Jul 2026 21:43:34 -0400
X-Gm-Features: AVVi8Cc0w7SFS4RVSXFx8cgnsY65blWLCVUQYTkpewwhwN1GbSM6-jMJhEOGaQ0
Message-ID: <CADkTA4OvRtmTqgXi4Gpsa+0xMtKoykX3AkszOESWBkW5Ei4Vxg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH v2 00/13] Container Improvements
To: ticotimo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Jul 2026 01:43:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9943

Thanks Tim,

I'm out of the office for the next 1.5 weeks. so it will likely be
after that before I look into this in any detail.

Bruce


On Mon, Jul 6, 2026 at 1:13=E2=80=AFPM Tim Orling via lists.yoctoproject.or=
g
<ticotimo=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> This series:
>   * Sets OCI_IMAGE_RUNTIME_UID with ??=3D weak assignment in
>     image-oci to allow container-nonroot-user to set a different
>     default
>   * Adds a class to create/run containers with a non-root user
>   * Adds a class to create non-volatile var log and tmp directories
>   * Adds a class to enable 'dev' mode where the container starts as
>     the root user
>   * Adds new containers:
>     - app-container-python
>     - app-containter-mosquitto
>     - app-container-valkey
>     - app-container-nginx
>   * Modifies app-container-curl to be more like the upstream
>     experience (and more like the above containers)
>   * Allows mosquitto and libwebsockets to be parsed for
>     vcontainer distro so we can build multiarch containers
>     for app-container-mosquitto.
>   * Allows meta-webserver/recipes-httpd/nginx to be parsed for
>     vcontainer distro so we can build multiarch containers
>     for app-container-nginx.
>   * Adds a fix for buildbot-venv shadowing for environment-setup-ci
>     script
>
> The resulting containers were tested with simple command line
> usage compared to Docker provided equivalents to ensure the
> same expected behavior.
>
> Changes in v2:
>
>   There were a fair number of changes in v2 in reponse to review
>   comments and observations during testing.
>
>   * image-oci.bbclass:
>     - set OCI_IMAGE_RUNTIME_UID with ??=3D to allow other classes
>       to override
>   * container-nonroot-user.bbclass:
>     - set EXTRA_USERS_PARAMS with +=3D
>     - added comments to clarify the PYEOF Python heredoc behavior
>     - added logic to detect $image_name/index.json and fail if not
>       found
>   * container-volatile-fixup.bbclass: avoid repeating the same
>     rootfs postfunc by adding a helper class
>   * container-dev-mode.bbclass: avoid repeating the same logic
>     to run container as root user in '-dev' mode
>   * app-container-python (and other container image recipes):
>     - drop now redundant IMAGE_INSTALL lines
>     - simplify by inheriting container-volatile-fixup
>     - inherit container-dev-mode
>   * app-container-mosquitto:
>     - verify '-dev' mode switches from root user to mosquitto user
>     - verify "production" mode runs as 'nonroot' user
>     - fix bbmask to allow mosquitto and required libwebsockets
>   * app-container-valkey:
>     - added tini and container-entrypoint.sh, like upstream containers
>   * app-container-nginx:
>     - fixup 'nonroot' user ownership of NONROOT_OWNED_DIRS
>     - fix bbmask to allow nginx (but not other recipes-httpd)
>   * fix for older distro hosts where the 'websockets' Python library is
>     not new enough (>10.0) and on the AutoBuilder needs to use 'buildtool=
s'.
>     The PATH in environment-setup-ci now plays properly with such a set u=
p
>     by no longer added /usr/bin and /bin before existing $PATH.
>
> Successful build https://autobuilder.yoctoproject.org/valkyrie/#/builders=
/117/builds/25
>
> Tim Orling (13):
>   image-oci: set OCI_IMAGE_RUNTIME_UID with ??=3D
>   classes: add container-nonroot-user.bbclass
>   classes: add container-volatile-fixup.bbclass
>   classes: add container-dev-mode.bbclass
>   recipes-containers/images: add app-container-python
>   recipes-containers/images: add app-container-mosquitto
>   vcontainer-bbmask.inc: allow 'mosquitto', 'libwebsockets'
>   recipes-containers/images: add app-container-valkey
>   recipes-containers/images: add app-container-nginx
>   vcontainer-bbmask.inc: allow meta-webserver/recipes-httpd/nginx
>   app-container-curl: use multilayer mode; container-nonroot-user
>   container-image-multiarch: add helper recipe
>   vcontainer-tarball: fix buildbot-venv shadowing
>
>  classes/container-dev-mode.bbclass            |  34 ++++
>  classes/container-nonroot-user.bbclass        | 155 ++++++++++++++++++
>  classes/container-volatile-fixup.bbclass      |   6 +
>  classes/image-oci.bbclass                     |   3 +-
>  conf/distro/include/vcontainer-bbmask.inc     |   6 +-
>  conf/layer.conf                               |   1 +
>  .../images/app-container-curl.bb              |  39 +++++
>  .../images/app-container-mosquitto.bb         |  43 +++++
>  .../images/app-container-nginx.bb             |  62 +++++++
>  .../images/app-container-python.bb            |  45 +++++
>  .../images/app-container-valkey.bb            |  71 ++++++++
>  .../container-entrypoint.sh                   |  18 ++
>  .../images/container-image-multiarch.bb       |  31 ++++
>  .../vcontainer/vcontainer-tarball.bb          |   4 +-
>  recipes-demo/images/app-container-curl.bb     |  46 ------
>  15 files changed, 512 insertions(+), 52 deletions(-)
>  create mode 100644 classes/container-dev-mode.bbclass
>  create mode 100644 classes/container-nonroot-user.bbclass
>  create mode 100644 classes/container-volatile-fixup.bbclass
>  create mode 100644 recipes-containers/images/app-container-curl.bb
>  create mode 100644 recipes-containers/images/app-container-mosquitto.bb
>  create mode 100644 recipes-containers/images/app-container-nginx.bb
>  create mode 100644 recipes-containers/images/app-container-python.bb
>  create mode 100644 recipes-containers/images/app-container-valkey.bb
>  create mode 100644 recipes-containers/images/app-container-valkey/contai=
ner-entrypoint.sh
>  create mode 100644 recipes-containers/images/container-image-multiarch.b=
b
>  delete mode 100644 recipes-demo/images/app-container-curl.bb
>
> This series can be found at
> https://github.com/moto-timo/meta-virtualization/tree/container-improveme=
nts-v2
>
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9924): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9924
> Mute This Topic: https://lists.yoctoproject.org/mt/120143346/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

