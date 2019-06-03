Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 94DFDE00D54; Mon,  3 Jun 2019 05:43:18 -0700 (PDT)
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
	*      [209.85.167.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBDCEE00D45
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Jun 2019 05:43:17 -0700 (PDT)
Received: by mail-lf1-f68.google.com with SMTP id l26so13456741lfh.13
	for <meta-virtualization@yoctoproject.org>;
	Mon, 03 Jun 2019 05:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EXPQBBHUjzkHb1/aUoIZS+Da7YTinMCWiJaHZrHxKXU=;
	b=m8eXPAQLD/LWsJCwRe8HMOuCbOUTpeYGEwKHod5egwY8J1Mo+sRC+4ddbPUPjRkx1B
	PXGfqqki6l5ZvYZx6SkQX6fdkntvglzr+2uhPR6JGY9zwx9+YyO1znxD0jQ4VFoVm/lH
	ynVEV/y55JttDru4zh9LSpOCLHMsfdKDt3hyQ+dMoumk8SpcyPaQvaiMnlpCbVIRLvx0
	kPY5ZQq+JTrmpyR+UC2ndcINtzr6IpAjjb9nyBIup4k00yg7HqnZaWwM87XgCguUesvE
	BD00cfn0BHhRMdgzb/63QJ35UvDS2FimgDjD/Y/N+JRP4mQsQ5eiJz2KV9xcKWq0LP8H
	d3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EXPQBBHUjzkHb1/aUoIZS+Da7YTinMCWiJaHZrHxKXU=;
	b=ioGarje8yMRZYArFFGT24EEp6kM5w5SUl6lg+B0ezaJVuavd8SGrqBWD7KX7RBefUe
	PDlhrUCxUKe5rg/PJHPD68weckWThiwFtRV9hiKK4fFd5DxB6119/EzoRCQCuKStMnBR
	Y+2NA83TwCruH3rBUwhpl1C0atZ+j67yiIVh4I0D3yMjyev6OwfNaJqTQwgme4JKAUxC
	PdRaw/G20FtT4RoviqGz2lZpUqbay7kP3c2ezUcWafCnYW8St72eiRN4lVCcx6Qox0f/
	KQFr9w/fE/LAN3eIOT08CsNE23Ak1Q9hG/dsUT0vX+zydWw05FcXwHJ8e2qoXa+OXIu4
	LoBQ==
X-Gm-Message-State: APjAAAXJQzXjQaZPIn/lPfzRPdkxntfcRqNMcN1Cee2DDu8CE0AjCt3Y
	s5eQKpe1/6EGBMGViovI6hw+DyvT5X/Yb7wd5+w=
X-Google-Smtp-Source: APXvYqxsBuVC6ae6+U0vWY4wuVns7fqCnnbTVDo6humvBkNCl9da8wcBKGPNbkNzO8qO/+qQMy3TBk7pAIEpXEDji3g=
X-Received: by 2002:ac2:5285:: with SMTP id q5mr13354642lfm.146.1559565796572; 
	Mon, 03 Jun 2019 05:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <1559195272-27896-1-git-send-email-hongzhi.song@windriver.com>
	<73c1cc52-4704-ac9d-d96f-3d4eaee93b00@windriver.com>
In-Reply-To: <73c1cc52-4704-ac9d-d96f-3d4eaee93b00@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 3 Jun 2019 08:43:05 -0400
Message-ID: <CADkTA4O695JAK6K9DoeTu=kAP-giBJVwhSL5QSEbGJvuee3DJg@mail.gmail.com>
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
X-List-Received-Date: Mon, 03 Jun 2019 12:43:18 -0000
Content-Type: text/plain; charset="UTF-8"

Please don't send pings.

Patches always sit for about 48 hours before I even consider merging
them. You sent this on a Thursday, with a weekend in between the send
and the ping.

So of course, they are not merged yet.

Bruce

On Sun, Jun 2, 2019 at 9:45 PM Hongzhi, Song <hongzhi.song@windriver.com> wrote:
>
> ping
>
> --Hongzhi
>
>
> On 5/30/19 1:47 PM, Hongzhi.Song wrote:
> >
> > Hongzhi.Song (4):
> >    iptables: update bbappend to match to oe-core version
> >    libvirt: update bbappend to match bb version
> >    linux: update bbappend to match oe-core version
> >    iproute2: update bbappend to match bb version
> >
> >   .../recipes-extended/iptables/iptables_1.6.%.bbappend       |  3 ---
> >   .../recipes-extended/iptables/iptables_1.8.%.bbappend       |  3 +++
> >   .../recipes-extended/libvirt/libvirt_4.%.bbappend           | 13 -------------
> >   .../recipes-extended/libvirt/libvirt_5.%.bbappend           | 13 +++++++++++++
> >   .../recipes-kernel/linux/linux-yocto_4.18.bbappend          |  9 ---------
> >   .../recipes-kernel/linux/linux-yocto_5.0.bbappend           |  9 +++++++++
> >   .../recipes-support/iproute2/iproute2_4.%.bbappend          |  4 ----
> >   .../recipes-support/iproute2/iproute2_5.%.bbappend          |  4 ++++
> >   8 files changed, 29 insertions(+), 29 deletions(-)
> >   delete mode 100644 meta-openstack/recipes-extended/iptables/iptables_1.6.%.bbappend
> >   create mode 100644 meta-openstack/recipes-extended/iptables/iptables_1.8.%.bbappend
> >   delete mode 100644 meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
> >   create mode 100644 meta-openstack/recipes-extended/libvirt/libvirt_5.%.bbappend
> >   delete mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_4.18.bbappend
> >   create mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_5.0.bbappend
> >   delete mode 100644 meta-openstack/recipes-support/iproute2/iproute2_4.%.bbappend
> >   create mode 100644 meta-openstack/recipes-support/iproute2/iproute2_5.%.bbappend
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

