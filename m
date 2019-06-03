Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1FE11E00D54; Mon,  3 Jun 2019 05:57:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49E05E00C43
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Jun 2019 05:57:34 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id q26so13526260lfc.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 03 Jun 2019 05:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IHFBeZje+XBsmlwNb5VPhkV7OKbRJjaCG5scPeQE88g=;
	b=ETyvD5rHYDysYqM78yX73xe2wBjiBZiusI+zakyV/6um10W5H76Z8JFZe04ChoRHDW
	mMdN0b8ZQeiNnO+YKAYl/Udd0Hl5qfQzI7NNE7IlTFNzw2LEaXhNjtaxk7pESHAuaCcA
	EwVstT4fqRby0S+bkd/A3q4j+JjPmgxNu8KPdGPR0/z7CpgZiInKlTCMUkyscvvYSXH/
	OLuRmuTle/nVWgNpBbJLN+Synx4UltcwU6qnLeIUEsfb4l7h3MP47IuWAwCz8QUwYiDA
	rxqDkEw3P7uSymNeypFIgfCyQ9sgf1cX8udqKdDaQ2W0ahgMX6qX9yXi/3YTcp7IM2BP
	wbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IHFBeZje+XBsmlwNb5VPhkV7OKbRJjaCG5scPeQE88g=;
	b=KFyWtx+XTzhP0twao+V2KpSc7acR9tZh+k+Wh2je1aN6RhCobCK47QgMTDTPLrHip8
	5lO1C5QvDttYxdD5QqR4iqFwS74+vf8lfEtLfvuMk47Nkk675oDmuY7sA33+eDzKn/BO
	2dCjldppdK2+uYm56jkt8SEDdwhl7O2IzlozRKgJtjRjvjueAE7i3C174oyGvY58p0zf
	6f0EbkAEaPPpMJYsOEN4sRG/FKT+BS4pk/ceWHzIF+Rqwv+qjwNqsJICuXWinLhF7TVn
	h1YS1DU6VqkXhiF+2ddSC8HKaNFhbFszMpZFx+UwLscvDtt3dsBMq+mRJyq9TnKCb47W
	2tJg==
X-Gm-Message-State: APjAAAXWJPHU+YN7keB5LK18sBlkqNcdXGeMfLaWIenFu1kvzH4khsec
	GT2bAg184ZU+jBl2HYW1CHrzDyRPxg3J6owoHGtenG6j
X-Google-Smtp-Source: APXvYqxG+hsQR3cY5wPDXeXQ+tMKnwtEMlAim2lTrh0JaUCfdSJ8h7MFXnk/HWPPxhd6j6721iTy5SJmyCMHKxkB1Lg=
X-Received: by 2002:a19:ec12:: with SMTP id b18mr13186779lfa.149.1559566653119;
	Mon, 03 Jun 2019 05:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <1559195272-27896-1-git-send-email-hongzhi.song@windriver.com>
	<73c1cc52-4704-ac9d-d96f-3d4eaee93b00@windriver.com>
	<CADkTA4O695JAK6K9DoeTu=kAP-giBJVwhSL5QSEbGJvuee3DJg@mail.gmail.com>
In-Reply-To: <CADkTA4O695JAK6K9DoeTu=kAP-giBJVwhSL5QSEbGJvuee3DJg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 3 Jun 2019 08:57:22 -0400
Message-ID: <CADkTA4OtuM+-LtRasbvimG2_WV3yS_VzHFEYX5KcztMPRGXE0Q@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH 0/4] update bbappend to match bb version
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Jun 2019 12:57:35 -0000
Content-Type: text/plain; charset="UTF-8"

I should have been more clear, it is ok to ping .. just not within a
few days of a patch series. If there is a specific, high priority to a
series, make sure it is in the cover letter and I can speed up
integration testing.

Bruce

On Mon, Jun 3, 2019 at 8:43 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> Please don't send pings.
>
> Patches always sit for about 48 hours before I even consider merging
> them. You sent this on a Thursday, with a weekend in between the send
> and the ping.
>
> So of course, they are not merged yet.
>
> Bruce
>
> On Sun, Jun 2, 2019 at 9:45 PM Hongzhi, Song <hongzhi.song@windriver.com> wrote:
> >
> > ping
> >
> > --Hongzhi
> >
> >
> > On 5/30/19 1:47 PM, Hongzhi.Song wrote:
> > >
> > > Hongzhi.Song (4):
> > >    iptables: update bbappend to match to oe-core version
> > >    libvirt: update bbappend to match bb version
> > >    linux: update bbappend to match oe-core version
> > >    iproute2: update bbappend to match bb version
> > >
> > >   .../recipes-extended/iptables/iptables_1.6.%.bbappend       |  3 ---
> > >   .../recipes-extended/iptables/iptables_1.8.%.bbappend       |  3 +++
> > >   .../recipes-extended/libvirt/libvirt_4.%.bbappend           | 13 -------------
> > >   .../recipes-extended/libvirt/libvirt_5.%.bbappend           | 13 +++++++++++++
> > >   .../recipes-kernel/linux/linux-yocto_4.18.bbappend          |  9 ---------
> > >   .../recipes-kernel/linux/linux-yocto_5.0.bbappend           |  9 +++++++++
> > >   .../recipes-support/iproute2/iproute2_4.%.bbappend          |  4 ----
> > >   .../recipes-support/iproute2/iproute2_5.%.bbappend          |  4 ++++
> > >   8 files changed, 29 insertions(+), 29 deletions(-)
> > >   delete mode 100644 meta-openstack/recipes-extended/iptables/iptables_1.6.%.bbappend
> > >   create mode 100644 meta-openstack/recipes-extended/iptables/iptables_1.8.%.bbappend
> > >   delete mode 100644 meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
> > >   create mode 100644 meta-openstack/recipes-extended/libvirt/libvirt_5.%.bbappend
> > >   delete mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_4.18.bbappend
> > >   create mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_5.0.bbappend
> > >   delete mode 100644 meta-openstack/recipes-support/iproute2/iproute2_4.%.bbappend
> > >   create mode 100644 meta-openstack/recipes-support/iproute2/iproute2_5.%.bbappend
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

