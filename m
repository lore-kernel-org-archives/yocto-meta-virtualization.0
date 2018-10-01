Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 46314E00B58; Sun, 30 Sep 2018 18:32:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7CFDE00901
	for <meta-virtualization@yoctoproject.org>;
	Sun, 30 Sep 2018 18:32:44 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id p6-v6so10561036ljc.5
	for <meta-virtualization@yoctoproject.org>;
	Sun, 30 Sep 2018 18:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KOnoSkEJ9Tf6Y4Aj3Oc7prsID1zVABtjtlYUcnIZQZ0=;
	b=dhnL8j60uo9tLM4ZVUODnf2IU4jra3QOZu4vCrifCjNlAiSvYNjFjw9oLa8W6vuZd3
	5QLV/QXyjWnxi3DQGzjt00nsrierKU+7NtNelpJ2gh/yls4PEXq5Kvax+FhpqvesIb0a
	NouiXPGJL3lrwPm3NsPT0AVlHzyiGpL0mTGiDEG9CSt0mdPg3sMgoafQczvjRwamAtuv
	DblrkF1fvzZ/gytzbvwVDhbBAD0Pg7dEsnjkbgzaua1Ex35QtmfTVpnX3gPAVHEFq0Rw
	jpWWXmfuUIjh6y+nnJyfSbyP7/H1EigBED7FSTsHwmCDVDQpJrdFxRVLa9o/s7UHCw1P
	1eSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KOnoSkEJ9Tf6Y4Aj3Oc7prsID1zVABtjtlYUcnIZQZ0=;
	b=hdRVvycAyzYOYsQOyJ02KLWBBoqj4gYqiFOvxayHPgiTbOIslqtJAxm3gN2HUY7cOC
	E8LMyoopn9a4uioBrA9Ipzt1DKfBWNE8bTN+wC5hof9jrXdsO1PBx9+AfhO9H5Y39iUV
	RuueEAOafbk310ED/mOHF8DYuwDcj2oTtl2sKzbJBq/ddTubcgwf9m9BkOh4Vgh9aovK
	lGXL20L9e/YXdb1drkTyNQ+a6B/5cx+HXLmbM1XlFUajmK6tdcMOCI/3wtqjomMROqwZ
	4tLj0K+d1QX3MJs0t8BCR0wufTw1xmlrrWBNdXMLFa1BYTPeS6J/AVlKOfZnckuSkfJD
	qhNg==
X-Gm-Message-State: ABuFfojVImpZ0mqYJo61mcauT1K0tTwGPW72Yc1UqGxM5qPVQZRNCrJu
	7n0qzYjqNSJlHHMdSVOv6hH2Kluh5+18lpTXDUs=
X-Google-Smtp-Source: ACcGV63IMRklhvMaVSoRuAsrkwx4gIbUt4EmDj+NSWVYq55VHJuKdKmozW0E9o77VrwoclQXdhse9kN/RLPbhbvEbx4=
X-Received: by 2002:a2e:8919:: with SMTP id
	d25-v6mr5360216lji.69.1538357563590; 
	Sun, 30 Sep 2018 18:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <1537961203-96269-1-git-send-email-zhe.he@windriver.com>
	<ec120586-08fb-f9a9-54e2-9f94b94c5702@windriver.com>
In-Reply-To: <ec120586-08fb-f9a9-54e2-9f94b94c5702@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 30 Sep 2018 21:32:32 -0400
Message-ID: <CADkTA4O19TY_-vPAvwNbRTJCSOLGKPrSEN9iKyDJuD-oKf7ANw@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] kernel: forcedly load nf_conntrack_ipv6 to work around kernel module loading failure
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
X-List-Received-Date: Mon, 01 Oct 2018 01:32:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I almost always let patches sit for 3 or more days to allow people
time to comment.

this is now merged

Bruce
On Fri, Sep 28, 2018 at 10:01 PM He Zhe <zhe.he@windriver.com> wrote:
>
> Kindly ping.
>
> Zhe
>
> On 2018=E5=B9=B409=E6=9C=8826=E6=97=A5 19:26, zhe.he@windriver.com wrote:
> > From: He Zhe <zhe.he@windriver.com>
> >
> > In the v4.18 kernel, there is a problem with the locking and init seque=
nce of
> > the kernel modules. This would cause nf_conntrack_ipv6 failed to be loa=
ded.
> >
> > In kernel v4.19, nf_conntrack_ipv6 has been merged to nf_conntrack and =
the
> > problematic code has gone. This patch just works around by forcedly loa=
ding
> > nf_conntrack_ipv6.
> >
> > Signed-off-by: He Zhe <zhe.he@windriver.com>
> > ---
> >  recipes-kernel/linux/linux-yocto_virtualization.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/reci=
pes-kernel/linux/linux-yocto_virtualization.inc
> > index c09b07c..5d3cbc6 100644
> > --- a/recipes-kernel/linux/linux-yocto_virtualization.inc
> > +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
> > @@ -8,7 +8,7 @@ SRC_URI +=3D "file://xt-checksum.scc \
> >           "
> >  KERNEL_FEATURES_append =3D " ${@bb.utils.contains('DISTRO_FEATURES', '=
kvm', 'features/kvm/qemu-kvm-enable.scc', '', d)}"
> >
> > -KERNEL_MODULE_AUTOLOAD +=3D "openvswitch"
> > +KERNEL_MODULE_AUTOLOAD +=3D "nf_conntrack_ipv6 openvswitch"
> >  KERNEL_MODULE_AUTOLOAD +=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
kvm', 'kvm', '', d)}"
> >
> >  # aufs kernel support required for xen-image-minimal
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

