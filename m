Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.36172.1595794657390655467
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 26 Jul 2020 13:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D7mGmH03;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id h13so10866723otr.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Jul 2020 13:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dBfz69nJ+c5mAaLzM1zffpeeK0Nyz6i9Resh9hbUqJA=;
        b=D7mGmH03wFz9dY4VtAbzKlPEfp0DzKF/5Qj7+0ROw6OfvEIVCzHOUFBYTuLXNGS52x
         hRYmrkVTD2j8pfeFeAYqxXS2JyHiBBZ/4J5PoQTs4pfyGoUK9NCx6X4jHpl/lOld+Sdf
         uqsSMKsm1gjqcMzOEN/fnn2VBSwVK42sJw+7LR4nAd0FGbMvbbDlTyhFohkVBPaq70eU
         mTdjH35xtnxmC9C1YRVg+YJhoxIQPwvVlnDrmS0Q58LmIYnWCEQ4/L2tCVTVWWLFpKC4
         E9LU0c00yEumXX4f8pRtrl+9PQifeSiz7K2ciWaefg+jSArv4QUBgxX1ewYKOxg4VrK3
         X/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dBfz69nJ+c5mAaLzM1zffpeeK0Nyz6i9Resh9hbUqJA=;
        b=ieQT+88UZCQjP57J8uYzpulO7eQjzC9tdpuvtAu+HFLOdielVUsYX+dfTAk0CJ/LQS
         G/okEF4CqodwgVlYMpC1j7H7eiT08i0vMHiVBqaMtJDpVGcj/chyAp5AfApwrfv8xa3E
         Zxd2z57h/1j7X220O4hXriGZXcAzouTDPBY/n5I7U+TXqxKfUrOs8oRqFlX5dPjbXWz+
         2uDRzV2kKH8fGg8YGxyqKu5FOzedgR6D1l/AUoELWyOy4k5O0WEdF8ubZaIp/+qBKOcw
         e7t6/nVy98l1dFW9F5RTgb5cBLHWKF+NzZCJRrxjip+bCo2jZhh9Z3UzAE19ZJMtIPIu
         M7lA==
X-Gm-Message-State: AOAM533zzP/egN5CITNP/dZ4FI44gAX+gQWdKiiZeQRiV/qydv2+NLPY
	wcmbGc0BNYKuD0qJ7Hf2k5fFkEX+HHy26LD59/M=
X-Google-Smtp-Source: ABdhPJzARR0RAO5mIKj0wVog19X9704G+V7WF/RpuhFjTPRMCf/KayP6gIMyOoR3ssSJz3+yoSDQQrXFRqZcYuWUvGE=
X-Received: by 2002:a9d:5915:: with SMTP id t21mr17277423oth.372.1595794656590;
 Sun, 26 Jul 2020 13:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <CACMJ4GY=g3zG4K-bRyUtSzKKQK9VjKyYg+N-09Y-M-yD9Z8m6A@mail.gmail.com>
 <27874.1595565463246869205@lists.yoctoproject.org>
In-Reply-To: <27874.1595565463246869205@lists.yoctoproject.org>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Sun, 26 Jul 2020 13:17:25 -0700
Message-ID: <CACMJ4Gbk6u=TcmYSFSau1GkHt0=5Nk06r48bFAB+nPY4J_cwcg@mail.gmail.com>
Subject: Re: [meta-virtualization] Comment / Feedback to include RPI-4 patches on DUNFELL branch
To: Ashish <ashishm@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 23, 2020 at 9:37 PM Ashish <ashishm@mvista.com> wrote:
>
> Hi Chris / Bruce ,
>
> - Thanks for pointers  as it added more clarity w.r.t process .
>
> - w.r.t " interest from contributors willing to provide resources to the project .."
> I can check with team coming weeks .
> I could get some dedicated time being assigned here ,but i can confirm back only after discussing with my team
>
> - With some initial pointers , i would like to contribute here .
> Do we have any pending task-list / weekly calls where i could understand more about process here .
> ( I come from driver development background so idea is to get an understanding of things here & ramp-up )
>
> Any comments / feedback / pointers would be helpful .

These are slides by David Reyna and Nicolas Dechesne from a
presentation delivered at the Embedded Linux Conference (virtual
event) in June this year. They describe the new LTS release process in
Yocto and the policy for handling changes to components:
https://static.sched.com/hosted_files/ossna2020/34/Yocto%20Project%20LTS%20ELC%20NA%20June%202020.pdf
obtained from:
https://events.linuxfoundation.org/embedded-linux-conference-north-america/program/schedule/

Here is a video with similar slides presented by Nicolas Dechesne
slightly earlier this year on the same LTS topic:
https://www.youtube.com/watch?v=K5cDsEQnjV4

It describes the strict rules about managing the release branches. All
changes must go into master first, and it states that general version
upgrades of components (such as Xen here) are not eligible for
admission to the LTS branch (ie. dunfell).

That said, if you look at the file: conf/layer.conf in the
meta-virtualization repository, you can see that although this layer
is being developed now for the gatesgarth release, it currently
indicates compatibility with the dunfell branch. If you assemble a
dunfell build tree of the other repositories, and meta-virtualization
from master (switching to gatesgarth once it is released), you should
be able to test using the updated meta-virtualization components with
the dunfell stable repositories for other components. If you are able
to test, exercise and validate this combination ahead of the next
release, there may be the opportunity to fix any compatibility issues
arising that are identified and understood prior to the next release
being issued.

For task-list and community calls which could be helpful for QA
issues, there is a Monthly Technical Call, and a Weekly Triage
Meeting, facilitated by Stephen Jolley, the Yocto Project Program
Manager.
Details of Bug Triage are here:
https://wiki.yoctoproject.org/wiki/Bug_Triage
Call details:
https://www.yoctoproject.org/public-virtual-meetings/

I would recommend subscribing to the Yocto mailing list if you haven't already.

Thanks for your interest!

Christopher



>
>
>
> 
