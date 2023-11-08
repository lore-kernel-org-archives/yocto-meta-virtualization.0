Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90C1C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 23:42:10 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.108753.1699486920683698251
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 15:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=QaCO4BYN;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.221.50, mailfrom: troth@openavr.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-32fd7fc9f19so124308f8f.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Nov 2023 15:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1699486918; x=1700091718; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v6PYxWFhsVwTbTH0edqm4xPq3x0qeOoEUO2INX6/fqs=;
        b=QaCO4BYNWtwsE0b49hziYTsBehQoNK4smApncaz1iq+F0JVqTZ7dYC7Ld0Vi6zHzYq
         1mgvNRPmQQekNOBPF8ymV58Z/R2+uUlrZjR2NAl8anus/NcvYVLbip9TBjqk1pLL/vh9
         m2cLIyeRABmwmuQyWXZk/NqbJSi9bHmxKtyr0Wvvg8689bqrWKIHo10wInF83QoRc0v6
         K7QlVqizyOUZDrnNER6rguPlCLfBIuiDgCdH7/0IwUCzAKhCLajMpNk9B8/aUAcx20Kb
         2vJ6+znnvq74cKYi1JcakSOMRpi/KG8w9+A5n+roZq2KQujXONua4g5g4wH5mkKuHq7f
         UP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699486918; x=1700091718;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v6PYxWFhsVwTbTH0edqm4xPq3x0qeOoEUO2INX6/fqs=;
        b=UZOYDO84y45fazyQ3ieCRKvgZsgX+JvCqg6LASuUUP2ofrXorKzT+lf3aC2/rWM0UM
         yrKQvf7wiMDsSICgmeRbleMk4Ait1PnghMzD6mNMpO5TyGyM8lLrxO45fXNCVZkpizSD
         qhg9zlWi1LO68/HaL7rupXzdzT5r0uRkql2/bOXcODf7lAcqUpUAroUxGqOpLoOx+iNY
         wNyzZw+RwIUlMBd6XQUut5KMsTq11l7V8bBFCll1YaCVWA+PVT5ta28Cwt4ZpiWckfUI
         j9vu1f+r+5M/OPRlhpeF0L/MI4bMhDQiQV+vtrkW3s9Ejv/rsymCytQ/1JLowLHZAkwf
         XfJA==
X-Gm-Message-State: AOJu0YwEoirVCtQr3/cRc39zjbgaK2JMDFfeD+ZPozQlJFdUHcP1AWKA
	78I/420J1E8WEdsCSABGwDihWIRcn/qKp+/zatiadevh95PAYuSRT+A=
X-Google-Smtp-Source: AGHT+IFlIf1vRHCK4GMLhfzAkY/zLUZUjTVn6qYq+md2I0WB8CTY2Vw3ZuCQ9AnVeKCSNl3xPl1xFN0coKXIPuK3DgI=
X-Received: by 2002:a05:6000:1acf:b0:32f:dca6:534d with SMTP id
 i15-20020a0560001acf00b0032fdca6534dmr3224901wry.47.1699486918514; Wed, 08
 Nov 2023 15:41:58 -0800 (PST)
MIME-Version: 1.0
From: "Theodore A. Roth" <troth@openavr.org>
Date: Wed, 8 Nov 2023 16:41:47 -0700
Message-ID: <CAFMvBt3aumWLd7vzsUHEZ5TvxDkC_2Tjfa=NJVe3qkkJxYieLg@mail.gmail.com>
Subject: Problems building podman and buildah
To: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Nov 2023 23:42:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8449

Hi,

With the recent updates to meta-virtualization master branch for
podman (to 4.7.1) and buildah (to 1.32.0),
 our builds are breaking.

I'm seeing the problem when building for either raspberrypi4 or qemuarm64.

The podman failure appears to be due to not using the native go-md2man
binary when building the man pages.
I was able to work around this by adding the following to the
do_compile() and do_install() functions
 in the podman recipe:

    export GOMD2MAN="${RECIPE_SYSROOT_NATIVE}/usr/bin/go-md2man"

I'm more than happy to send a patch if that is the correct fix.

I'm stumped on the buildah failure. Here's the error messages:

NOTE: Executing Tasks
ERROR: buildah-1.32.0-r0 do_package_qa: QA Issue: Architecture did not
match (x86-64, expected ARM) in
/usr/lib/go/src/github.com/containers/buildah/internal/mkcw/embed/entrypoint
[arch]
ERROR: buildah-1.32.0-r0 do_package_qa: Fatal QA errors were found,
failing task.
ERROR: Logfile of failure stored in:
/home/troth/work/bedrock/bedrock-main/build-rpi4/tmp/work/cortexa7t2hf-neon-vfpv4-trimble-linux-gnueabi/buildah/1.32.0/temp/log.do_package_qa.1252786
ERROR: Task (/home/troth/work/bedrock/bedrock-main/build-rpi4/../oe/meta-virtualization/recipes-containers/buildah/buildah_git.bb:do_package_qa)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 5377 tasks of which 5353 didn't need to
be rerun and 1 failed.

Summary: 1 task failed:
  /home/troth/work/bedrock/bedrock-main/build-rpi4/../oe/meta-virtualization/recipes-containers/buildah/buildah_git.bb:do_package_qa
Summary: There were 2 ERROR messages, returning a non-zero exit code.

This looks like bitbake is not using the go cross compiler to build
the buildah binaries.
Since I'm not versed in go development, I don't know how to fix or
work around this one.
Looking over the recipe and comparing it to other recipes did not
yield any obvious change that I could try.

Curious if anyone else is seeing either of these issues to allow me to
determine if this is specific to my setup or a general problem with
meta-virtualization.

I'm building all of this using the master branches of poky,
meta-openembedded, meta-raspberrypi and meta-virtualization (all
updated from upstream git servers today).

Can provide any other information if needed.

Ted Roth

