Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.11749.1626291232106191047
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Jul 2021 12:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nIbxtGvX;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id bu12so5215087ejb.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 14 Jul 2021 12:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xFzu+J52qOsxlpGvHR7K3BT9Ubx9uDV5Nm5LT3QkUhE=;
        b=nIbxtGvXjceGhia3lh81JavYL9Wtq+RLgiujRF10nzhZ8vrwomCU0ODvZofuHEeYHE
         2/cOe7qzMwbHogKrqwRllH9uWAUs7g+enpIDioe3zkrvcU292sMYbWG5oU0APBOGMZEm
         iNFj/vDmc3SPjzSYGnLkkGeX1spe1lGfO00PEG6GJZbcBu5TqA92srCl5qFm8laj0s98
         s7/KDqa7Hh0h9FmqhqanozH5+wNlkcBKBFLvOmekXKL6HA1bDWw/6RUXs6mY/I6DpJA3
         o9MyY2tDV1vOB5WkT4TZWG09eLbDrHNYKYUcAztARYYfb6c1FRj1RzpjLUEdlwloDw1v
         C2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xFzu+J52qOsxlpGvHR7K3BT9Ubx9uDV5Nm5LT3QkUhE=;
        b=NGqDp8OkKZqgP8Ejs63wN1Wa8XxIFtnieW/Vt3x0elPBo+xCe7MpgP/2Tlbmr2Ce2B
         +vNgFhfS3jEPPfXT88BA9MSWwCYmo3SuWnZBw0IFTTpssB252Q+8nXIWYVGfOBWnS5ix
         JWM703+l2pBWjoL9D6Y4nvlJaf04FSNJar6SmQ9kwoVgJPxBTxjZggaQi3mDud0BP6Vh
         X81IgwmDB7uj5yseB1+EgT/wVe8stAa+m5RPyqIJU1sbm3R3OGzhOJZI0hJXVo03I2zL
         IA2+C1JL4fG7pR8bS/ZayeB2qIi4s/Ns29TbMZtiUawp6kBxNcRXuXaX0A/u11fEO3oW
         Ac8g==
X-Gm-Message-State: AOAM532777vW9ietmeFhqCfmg/Pjxdt/lwkly2l66+Ko/YUmRM7QPPBM
	8S6trHxKpoK53c7ZkWjacnHNAcr/UdqP7VtPC54=
X-Google-Smtp-Source: ABdhPJyz82aZpmokh1XaN1mwcdVHGx8AwPv4XqwO9M0AGEUBRitm6Ob0hf/morcxf2I3+gZqsjrK7Vh0vZhkpe9/Rvk=
X-Received: by 2002:a17:906:2cca:: with SMTP id r10mr13638888ejr.298.1626291230553;
 Wed, 14 Jul 2021 12:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210708043246.126719-1-christopher.w.clark@gmail.com>
In-Reply-To: <20210708043246.126719-1-christopher.w.clark@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 14 Jul 2021 15:33:39 -0400
Message-ID: <CADkTA4NsgSGcHzayEfWGKWZK0BsDFr5vG8GaXP37Q3PMtbiv-Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 0/4] Xen and XTF build fixes series
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Doug Goldstein <cardoe@gentoo.org>, Diego Sueiro <diego.sueiro@arm.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, andrew.cooper3@citrix.com, 
	Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>
Content-Type: text/plain; charset="UTF-8"

I haven't heard any objections, so this is now merged to master.

Bruce

On Thu, Jul 8, 2021 at 12:33 AM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> Pull in updates from upstream Xen and XTF for GCC 11 and fix passing
> compiler flags for the Xen hypervisor, tools and test framework.
>
> Changes since v1:
> - for Xen 4.14, drop the previous cherry-picked compiler fix patch
>   via an update of SRCREV to the current tip of stable-4.14
> - add a patch to drop an unnecessary compiler flag override for
>   the Arm 32-bit Xen tools build
>
> Christopher Clark (4):
>   xen, xen-tools: apply upstream fixes for gcc11 compilation
>   xen, xen-tools: fix build and passing of CFLAGS via Xen vars
>   xtf: fix build with gcc11 SRCREV and specifying linker
>   xen-tools: remove Arm 32-bit compiler flags override
>
>  ...ry-Fix-osdep_xenforeignmemory_map-pr.patch |  33 ++++++
>  ...x86-make-hypervisor-build-with-gcc11.patch | 111 ++++++++++++++++++
>  recipes-extended/xen/xen-hypervisor.inc       |   3 +-
>  recipes-extended/xen/xen-tools.inc            |   6 +-
>  recipes-extended/xen/xen-tools_4.14.bb        |   3 +-
>  recipes-extended/xen/xen-tools_4.15.bb        |   1 +
>  recipes-extended/xen/xen-tools_git.bb         |   1 +
>  recipes-extended/xen/xen.inc                  |  13 +-
>  recipes-extended/xen/xen_4.14.bb              |   2 +-
>  recipes-extended/xen/xen_4.15.bb              |   1 +
>  recipes-extended/xen/xen_git.bb               |   1 +
>  recipes-extended/xen/xtf_git.bb               |   3 +-
>  12 files changed, 167 insertions(+), 11 deletions(-)
>  create mode 100644 recipes-extended/xen/files/0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch
>  create mode 100644 recipes-extended/xen/files/0001-x86-make-hypervisor-build-with-gcc11.patch
>
> --
> 2.25.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
