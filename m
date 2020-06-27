Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web10.14712.1593283665408880616
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 27 Jun 2020 11:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hRP0pJA5;
 spf=pass (domain: gmail.com, ip: 209.85.210.66, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f66.google.com with SMTP id t6so11724212otk.9
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 27 Jun 2020 11:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uydtp3F5JW4I1WqTeOtwgNbrjxqOfgpnZQQPCgbeYcg=;
        b=hRP0pJA5XWmbxTjJsbQlgIw4s4KcA+LqHP7cL95V3jjOjjsfvmWVgiG/5bfv3w+IBi
         4pFHRiCTfE8gqWpNYwxUK0BrDFnLo+974f6xCMuJQIk4RcnpCev6MbR9aVxV4oKKBamT
         nPIwv1pH0KLuY9wkK6iok0S25nS5OnEDLpwdOffW8YLRNA0BxwJHDdMXDGuK9udIbgJh
         iLZYBzu1LaArQIdmz7KCWQ8krcemGI/+7IF+i34groqsn/h7J5RGbpTRoAarqmQu73Yz
         23K8yPLY8RWKyyDGIYdmr+3E5H+R9VOuRob/04EhBKVITUFxiyRcBpO0FPRRKS2LFu5J
         QZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uydtp3F5JW4I1WqTeOtwgNbrjxqOfgpnZQQPCgbeYcg=;
        b=dvWsVIhZbplXHrdbff2p7hCzFNuiOVcSXrAWU+aN4P+/DHRyBsR9Uc1cLnbE1kBqiV
         PRw4rlvnuRghFiZrxSrp5tz9DJt+i8g5inDeEXzxMmcl16ZM3Nveng540bMgO8rQmeeD
         58BrV0cytwlLo6TS8DwXc4yZKR2iVcvSljjGWKUZglS1xKpmU+b9VFNH6T+0E2lMzVHo
         WsV+C/UAsGLjH8fa1Y1920pwEcdFr9UHPlyRttmoX18tAV0mSOjLcEo9xSNPtrc9cacP
         Vf05whRWaVXyTnNsYH4MSSeVc5c7aM+cuENHwalGEGqRe9K+lPR7niClzplHDsoK6NEH
         iJ+w==
X-Gm-Message-State: AOAM5325E1dgrtzOXN9/udIF3/1Voe4VoIi/PT/WyQgehwLuIMQlzAfM
	er4kPx0VcaPOHGc78ORIyLii3IpZQt6dCxn53r8=
X-Google-Smtp-Source: ABdhPJzNVnznlMnBwJMMXE08UqKCHAo16dUBTWPYb/fKUzxLUM5lXfuR0qpFglHa/MRkkqpxQed/O840BvH6wRRvAaY=
X-Received: by 2002:a9d:44b:: with SMTP id 69mr5177858otc.372.1593283664729;
 Sat, 27 Jun 2020 11:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4M45LUymcpPiMx=LxRq+5-RQuSVoajVzL4Jw=jUNJ_5EQ@mail.gmail.com>
 <29481.1593234915484473912@lists.yoctoproject.org>
In-Reply-To: <29481.1593234915484473912@lists.yoctoproject.org>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Sat, 27 Jun 2020 11:47:32 -0700
Message-ID: <CACMJ4GZynDh_NL6-h0MFB9pBgcgUcGo_+ykPKxATXXaK7td0pQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 00/10] Xen on Raspberry Pi 4
To: Ashishx88 <ashish.emailaddress@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 26, 2020 at 10:15 PM Ashishx88
<ashish.emailaddress@gmail.com> wrote:
>
> Hi Christopher ,
>
> I am able to compile  core-image-minimal &  xen-image-minimal images .

Excellent. I've been using xen-image-minimal for
build-and-boot-testing this work so far.

> Would be trying to boot the board with these images for which :
> - Are there any specific test that can help to confirm that xen aspect is proper
>     ( like ifconfig & ping for ethernet )

The Xen Project runs "Test Days" prior to releasing major Xen
releases, where volunteers perform basic tests of Xen on their
available hardware and report the results to the community and the
release manager. The wiki page for this is here:
https://wiki.xen.org/wiki/Xen_Project_Test_Days

and there are several pages related to that, including:
- Xen ARM Manual Smoke Test: https://wiki.xen.org/wiki/Xen_ARM_Manual_Smoke_Test
- Testing Xen: https://wiki.xen.org/wiki/Testing_Xen

Xen 4.14 is approaching release, so there is testing activity at the moment.

The instructions on the pages above are not explicit test cases
though, so some familiarity with Xen is assumed. I'll add a few notes
below.

> -  Basically try to know by list of  check by which we can confirm XEN functionality on image.

* Booting:
You should be able to observe the boot console messages if you have a
serial port connected. By default at the moment, you won't see much
different to a non-Xen boot on the HDMI display. If boot is
successful, on the display you will see four raspberries in the top
left hand corner and be offered a login prompt.

* Simple commands to verify basic Xen functionality at the console:

xl list
This should show that Domain-0 is running.

xl info
This should display detailed version information about your hypervisor.

ls -l /dev/xen
This should list a series of xen-related devices, including privcmd.

xenstore-ls
This should show the contents of the xenstore tree.

dmesg | grep Xen
This should show the Linux kernel recognizing that it is running on Xen.

xl dmesg
This should show the Xen boot messages.

I'll be talking about running Xen with a Raspberry Pi 4 at the Yocto
Project Dev Day virtual event on Thursday (2nd of July).
https://www.yoctoproject.org/yocto-project-dev-day-virtual-north-america-2020/
I would encourage you to attend if you're interested. (please note:
the specific time slot for this may vary on the day.)

thanks,

Christopher

>
> Thanks ,
> Ashish
>
>
>
>
>
> 
