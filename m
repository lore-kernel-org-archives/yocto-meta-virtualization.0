Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A422E00C88; Sun, 27 Jan 2019 18:12:32 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.65 listed in list.dnswl.org]
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01DE4E00C38
	for <meta-virtualization@yoctoproject.org>;
	Sun, 27 Jan 2019 18:12:31 -0800 (PST)
Received: by mail-yw1-f65.google.com with SMTP id g194so6164576ywe.7
	for <meta-virtualization@yoctoproject.org>;
	Sun, 27 Jan 2019 18:12:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc;
	bh=Ueo7k9HFTjU1CO5suHoS4LR1Wlhk3SgWGux5KvmiR94=;
	b=is7PtkT9QjclN8jyASo2RfFbHSW+UnOhsjxWOyF+aIFeDYu0PvVr8xOk/nuTPwV4OX
	Eq7YsCyVSeMaLEjUOZ334NhFtKomrHl2pGbhtcIpEVFGZMtL+bTWPc2G8rJ8q6Xhy2lT
	lc2nB7g+7vWyUeqfZGl8btt9xd1Ic+o4hg2WAvxg9ZW1OLDncFQOW+nPBjOI0VI3uIp+
	c1hM5Pi09+4FH/5GeW9n/cvQtQopFPAZHvdxut/esYzjcKmKKx+0QbCWeVhXOwdXDcIV
	tOY7oJvKWyNjTuElOflQKAUi83Rco4s0Ro2BKhUyFnrZDdm4v56HySGab1bARTVW7IFZ
	x4Dw==
X-Gm-Message-State: AJcUukcu2LCbUy7fszssMAen9/NhUqSX6oPbH5862+rCA2UeERjnNhj6
	k5iobk94QY7ST3Bzbl97DRUBedDWNzegplB59gI=
X-Google-Smtp-Source: ALg8bN7JDZnIj12eIUK761fIXdX2qo7ApY491FYKnj7J0++hIsfJVRksI7GblzPRt3yOdCpbV1z7gq7nm46n2Nsn4v8=
X-Received: by 2002:a81:d804:: with SMTP id d4mr18962401ywj.197.1548641551104; 
	Sun, 27 Jan 2019 18:12:31 -0800 (PST)
MIME-Version: 1.0
References: <1543355289-16095-1-git-send-email-mark.asselstine@windriver.com>
	<b58b948f-ffe0-e02b-daeb-512361b2aa2a@windriver.com>
In-Reply-To: <b58b948f-ffe0-e02b-daeb-512361b2aa2a@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Sun, 27 Jan 2019 21:12:18 -0500
Message-ID: <CAPuovEJ5zLrOJZs88f3S1ydenUbhay6Rv-dDRBfu1c7jXQ3__Q@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] openvswitch: uprev from 2.10.0 to 2.10.1
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2019 02:12:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 27, 2019 at 8:36 PM Hongzhi, Song
<hongzhi.song@windriver.com> wrote:
>
> Hi Mark,
>
> Which tests have you run for ovswitch. I want to update ovswitch to 2.11
> which will fix issue.
>
> I have run ptest which executed 2764 cases, and 320 failed, 86 skipped.
>
> Do I have to run other tests?

I usually rely on the ptests results and then I do a networking test
with OverC (the cube-vrf makes use of OVS), though the ptests should
be enough. Unfortunately I didn't document the ptest results for the
last few uprevs, the last time I did document the results in the
commit log was with commit 1fd1ff3720140baa3680d795f6d97597e5113e90.
Maybe what you can do is run the ptests with the current release and
then run them again with the 2.11 uprev and ensure they are similar.

The tests that usually FAIL are the py2 related ptests as I usually
only have py3 on my images.

MarkA


>
>
> Thanks,
>
> Hongzhi
>
>
>
> On 11/28/2018 05:48 AM, Mark Asselstine wrote:
> > Pickup the latest security and bug fixes for openvswitch.
> >
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> >   ...nvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch} | 0
> >   recipes-networking/openvswitch/openvswitch_git.bb                     | 4 ++--
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >   rename recipes-networking/openvswitch/openvswitch-git/{openvswitch-add-ptest-5563e309b80bbea9bff538e71ecfd7e5e538bab9.patch => openvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch} (100%)
> >
> > diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-5563e309b80bbea9bff538e71ecfd7e5e538bab9.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch
> > similarity index 100%
> > rename from recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-5563e309b80bbea9bff538e71ecfd7e5e538bab9.patch
> > rename to recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch
> > diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> > index a930933..b8bbb3a 100644
> > --- a/recipes-networking/openvswitch/openvswitch_git.bb
> > +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> > @@ -14,11 +14,11 @@ RDEPENDS_${PN}-ptest += "\
> >       "
> >
> >   S = "${WORKDIR}/git"
> > -PV = "2.10.0+${SRCREV}"
> > +PV = "2.10.1+${SRCREV}"
> >
> >   FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
> >
> > -SRCREV = "5563e309b80bbea9bff538e71ecfd7e5e538bab9"
> > +SRCREV = "78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e"
> >   SRC_URI = "file://openvswitch-switch \
> >              file://openvswitch-switch-setup \
> >              file://openvswitch-testcontroller \
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

