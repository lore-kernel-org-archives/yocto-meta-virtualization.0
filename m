Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.11040.1594216611486860383
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jul 2020 06:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tt42VA6Y;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id c25so19372024otf.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Jul 2020 06:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WniUoVgxyWb41ew/VQIAZHVKalpcKVl1Ka3SQqMZztg=;
        b=Tt42VA6YkA0qtjJdfN6BhAXT2A0t7lB+pE35m3HgUR6lDbuC9j0jwtaQc/qFpGNWEU
         wY+LRJZ66M9PaIiSj4CM55+gyCkqNQlIM41cewXZCZLgA42HBTZZPSfFBckvjgY/pEOM
         8z2rI557lUm9S5L+YVTVT85eXfgBCW+oYAudgXbMxU6udhZbHx+tYb9SJe5P0r/WyH4B
         DyM3WUCaeqk8axQ6aMShguOmy600a2MrvdrP35AIWIBJ4M0fbSvH9t+8TCefH9Q9tm6N
         MheoBzyPpxqJ3fkUl0zC3+JeU/nX8NZhQ09fbLBOwfcFbOSxpKv9PNXWmYPQbhjXQFsn
         2xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WniUoVgxyWb41ew/VQIAZHVKalpcKVl1Ka3SQqMZztg=;
        b=TvaAlJqy4x6J+DeB6nrWXc5XaPy7CeB9RnA5nTejYsGjnNSM2ag7uccK82HjIR+mm6
         tFuYulomMgOPWjZcrxEQ1osMwB9obEbBzyj72rbN+we27LCx66Gk+Valxsnqg4CxAcTA
         3MUXBfNj7Zlbb+1dTwVOgQrZpLTnS0izdCteRl7KJPyBce4fs+nFdNMcVh0W88QnkhWF
         hYwJD0XxbN7tEdobnVTuTXWAbgVYMVXKhRFmXH5eaTvf9iaQLTMOXgXkRl9mePXG5Mq4
         ogumuET5vGag2PsIEH9vuZlPCcvU3aLGxFHeZt1UQpNj6Z2MaBK7qFndaP2tiHLIufSj
         OVYQ==
X-Gm-Message-State: AOAM532UgtOVG3pANv4b0s9b8YClbPpvFSvhowBGKgYhBIpCbPV46yNu
	08wNGLfAAPDlWkuSvR93CF6C0tyRalnJWb0R4N8=
X-Google-Smtp-Source: ABdhPJyU9KLDqFSFDsvsK6YuovgS8x26B5HFWpNCtzsheeroQDllTb8KYeIthwyeR9FZl3vWcvqq721n3/h+mj77xms=
X-Received: by 2002:a9d:5915:: with SMTP id t21mr9125161oth.372.1594216610785;
 Wed, 08 Jul 2020 06:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <bt6y.1594192349425584301.iaNZ@lists.yoctoproject.org>
In-Reply-To: <bt6y.1594192349425584301.iaNZ@lists.yoctoproject.org>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Wed, 8 Jul 2020 06:56:39 -0700
Message-ID: <CACMJ4Ga3p=4OucfPwBoPvHaL64Qyhbcn9S9x7wSvjgKPs9RB-Q@mail.gmail.com>
Subject: Re: [meta-virtualization] [raspberry-pi4-xen-series] : Console login failure for xen-image-minimal
To: Ashishx88 <ashish.emailaddress@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 8, 2020 at 12:12 AM Ashishx88 <ashish.emailaddress@gmail.com> wrote:
>
> Hi Christopher ,
>
> - I have created an xen-image-minimal using the commit & repo mentioned
>    https://lists.yoctoproject.org/g/meta-virtualization/message/5464
>    I am able to compile both core-image-minimal & xen-image-minimal .
>
> - When the board boots with the compiled image , i am observing below mentioned issue
>    Can you provide any inputs or if same issue has been observed with other members :
>
>    1) At the login prompt , root credentials fails continuously for few time.
>        raspberrypi4-64 login: root
>        Password: root
>        ( I can assure you that there is no typo error )
>
>    2) After few attempt , i get the  root prompt root@raspberrypi4-64:~#
>        After the prompt within few seconds i get Login timed out after 60 seconds.
>        and behaviour starts again from point-1 mentioned above.
>        -> Attached along is the minicom log for your reference.
>
>    3) Similar login problem i have seen with core-image-minimal
>        Local.conf :
>                           DISTRO_FEATURES_append = " xen virtualization"
>                           MACHINE = "raspberrypi4-64"
>
> Hence can you please let me know if similar observation is being reported.
> and any pointers to look for the issue .

This looks like an unhappy serial device.
Please could you confirm: if you connect a local USB keyboard and HDMI
display, you do not have a similar problem logging in or using the
prompt?

thanks

Christopher


>
> Thanks ,
> Ashish
