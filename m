Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3FDC4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 14:10:05 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.20829.1669212599654246893
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Nov 2022 06:09:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L4ZFLOSH;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id d123so13205599iof.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Nov 2022 06:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oXv8ViVzv+3UC1dVN04wHxlIIX1xS5066tUsQP/DsGI=;
        b=L4ZFLOSHHq2plSWJgx239xb9/4w7mdgoF1zbyg5ZkiuLV6Mybku2a8roPWNwygE5Yz
         7hn4yZnNtz/th88DTzwMSFa2ajiYT33MSi2vZVlIBDkcVTCNnPFXtqqgNDzN9y8L5FDV
         EXygfGSNWUUHNgFW7FF8FIIMTbqkS2AJT3gR4824JB9oxLNhe601KnX9nE1FLj5jua1o
         5yi7Poejplnw6OZn0b4aDDAzPEIiMCmb4xRuV00njjVjBehS1W1oR12YtDOh/yoAWFc7
         slAMyUHER33AGRwWzTJYxGSUkYfZx0slRuyz0ROnOoNj8B/VdkY06vhvI7ct0FbdQVE6
         cA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXv8ViVzv+3UC1dVN04wHxlIIX1xS5066tUsQP/DsGI=;
        b=a+nGPNvGtLvv9Z5JFlFBwM3ntVXajsky2EfQTVw4WphmZoF3R3+NY/2cwkmp7zro4D
         Lna2gTvM4LXSFouTEcOf582txe7QdFONCDYWTqbpLjeaswLMbSkAQ4kSYPOoWA3Lnpj3
         HXDWr0GgiNfnC98yzPgvtoHMRekuVNk/L9Nh8hld3NMEbRTCBQMEt2Ma+pdWJSKJJdd7
         l1gcuYoTrdhgXNBAlzjP/dmf+7/TJEYdM0nZJ+lnF8xloSMT0/gAKysv12JvubPv2CFY
         dotacC/LIPX5ozQDElYBBIjv3Jvx2YIcVaU+ByS6FySIIxELJPKXck/lictIJlRAzEvC
         pWEg==
X-Gm-Message-State: ANoB5pknXdaIGGJPkYByBvWuLapRSNEbRWrHPoCcnxKe/uKGFm8kDeqN
	mSoG4hIgt5PZrim/3ueDkmiO2bbBYnqOe8C8ZXy/tm6/zo5yWA==
X-Google-Smtp-Source: AA0mqf7k4pA9AIQeSK8RkFw6IPihFwaYgWFtmVKOZsY/e6cY1t9plURVe+ZfSczu4I+S4IGgfDWHQ5POiKLfyS21CvQ=
X-Received: by 2002:a05:6602:180b:b0:6de:ef1:845 with SMTP id
 t11-20020a056602180b00b006de0ef10845mr3637984ioh.98.1669212598917; Wed, 23
 Nov 2022 06:09:58 -0800 (PST)
MIME-Version: 1.0
References: <20221030161333.12430-1-f_l_k@t-online.de> <20221030161333.12430-2-f_l_k@t-online.de>
 <CADkTA4PfHFDrq5McxwSLg957MpFVjZgWpUiBzFm18AM4xUO-sg@mail.gmail.com>
 <6GGOKR.9UDK9PG7M6LM3@t-online.de> <1723CB4C1BEE0B79.10635@lists.yoctoproject.org>
 <CADkTA4N0z=j7AjV9g1-kHnTzX8vSgDSL_4Qj8iNZaeXjyQdtwQ@mail.gmail.com> <V6BTKR.V7B3NTHJZAU82@t-online.de>
In-Reply-To: <V6BTKR.V7B3NTHJZAU82@t-online.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Nov 2022 09:09:47 -0500
Message-ID: <CADkTA4NCtsL_X9arHs7z1F2-Tf_npbTqqcFWZUh=TBLXfdC_Yw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] virt-viewer: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Nov 2022 14:10:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7695

I had to put this aside for a bit, but am back looking at it.

The build paths QA failure comes from the use of glib-mkenums, which
definitely generates files with absolute paths. I don't see any
options available in its documentation for sysroot or relative
patches, so I'll need to come up with some sort of fixup.

I'm also now seeing a failure on the latest OE core master (and
master-next of meta-virt), like this:

nfig-domain-capabilities-os.c.o.d -o
libvirt-gconfig/libvirt-gconfig-1.0.so.0.4000.0.p/libvirt-gconfig-domain-capabilities-os.c.o
-c ../git/libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.c
| In file included from
/opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/glib.h:52,
|                  from
/opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/gobject/gbinding.h:30,
|                  from
/opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/glib-object.h:24,
|                  from ../git/libvirt-gconfig/libvirt-gconfig.h:27,
|                  from
../git/libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.c:23:
| ../git/libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.c: In
function 'search_firmwares':
| ../git/libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.c:70:26:
error: pointer targets in passing argument 1 of 'strcmp' differ in
signedness [-Werror=pointer-sign]
|    70 |     if (!g_str_equal(node->name, "enum"))
| /opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/ghash.h:165:39:
note: in definition of macro 'g_str_equal'
|   165 | #define g_str_equal(v1, v2) (strcmp ((v1), (v2)) == 0)
|       |                                       ^~
| In file included from
/opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/galloca.h:35,
|                  from
/opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/glib.h:32:
| /opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/string.h:156:32:
note: expected 'const char *' but argument is of type 'const xmlChar
*' {aka 'const unsigned char *'}
|   156 | extern int strcmp (const char *__s1, const char *__s2)
|       |                    ~~~~~~~~~~~~^~~~
| cc1: all warnings being treated as errors

If you have any cycles free, I'd be interested to know if this is
specific to my builders, or if others are seeing the same thing.

Bruce

On Fri, Nov 4, 2022 at 3:23 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Am Do, 3. Nov 2022 um 11:23:25 -0400 schrieb Bruce Ashfield <bruce.ashfield@gmail.com>:
>
> but libvirt still has other TMPDIR QA warnings that still haven't been fixed, so I don't consider this an absolute blocker. I'll have a look and try to fix it.
>
>
> Thanks for the help!
>
> Markus



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

