Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD28DE00C89; Wed, 21 Nov 2018 06:40:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.219.181 listed in list.dnswl.org]
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
	[209.85.219.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A2DAE00C60
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Nov 2018 06:40:19 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id t13-v6so2279658ybb.8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Nov 2018 06:40:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=yX1bl9vMUGX/VuScqi3tf1sOTYLHSapVn9CngaZ04xU=;
	b=hfcEM7VPGHdzrrJTXMZ2YWm3gWB48/8iB5Cjk3tqA4wILQ4JrFs5CPQ6YcvEM2HSyh
	b5XahaRcF0JcKBqABwtG5eXlNDuF7FUCv83B4IptohhcM7Cnuj0UMNtTv/1OOA9gr9T/
	Q/WKteyiyZ9x9q6EyU/QTKv2TznM2Bu8gMbPipuYkYPqhelvu4h8uob2m7rUwVwMN7LS
	+ZqoHQB+cdMPakMP56ef4Sk9VRwP3fmWxiZNyMCXJ8NZtMuvbFgtBuhKU8esA5QjwLt9
	vxusmQ360v1AOQjp2COVgPej8J3sKz6fXwjNzEPZyfr9DlBLhoTR3zSPNhHp5IYq3vLm
	ER7Q==
X-Gm-Message-State: AGRZ1gKjGAciqDhJCvq5LEWcaZfEdpuhbEy4B9lyqOQfD0kUxlZUblB0
	bggMAz1yiBA7hEu5Hd1hAV7toSKeg4afeLUU1WU=
X-Google-Smtp-Source: AFSGD/VNXm0En/KHLeaWpQdgEvd6wll1mg01vcDb+HuLI4E47k87WNpmc0oeiywv87nIdtG6/EWJs7qkNbNDZwgP8jY=
X-Received: by 2002:a5b:587:: with SMTP id l7-v6mr6376666ybp.76.1542811218730; 
	Wed, 21 Nov 2018 06:40:18 -0800 (PST)
MIME-Version: 1.0
References: <CABOWBEftJQEUAkdHwcSKUq6ZEcOq9zJFNh5C0riFLHrbc4-UBw@mail.gmail.com>
In-Reply-To: <CABOWBEftJQEUAkdHwcSKUq6ZEcOq9zJFNh5C0riFLHrbc4-UBw@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 21 Nov 2018 09:40:07 -0500
Message-ID: <CAPuovEKG9j0eYyY7tA=2S==vH_RmkjN1MTPLfNVMt_0sOY0S=Q@mail.gmail.com>
To: hackdef@hack-defender.mx
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Request to backport libvmi to krogoth
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
X-List-Received-Date: Wed, 21 Nov 2018 14:40:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 17, 2018 at 4:29 AM HackDef <hackdef@hack-defender.mx> wrote:
>
> Recently libvmi recipe was added to meta-virtualization on master branch:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipe=
s-extended/libvmi/libvmi_git.bb
>
> But I use krogoth branch with my current board, so, tried to copy the rec=
ipe to krogoth branch but throw error on libvirt about: Nothing PROVIDES li=
bxl, then added new dependencies found on libvirt from master and now throw=
s: Nothing PROVIDES libdevmapper, so I guess the best approach should be to=
 request backporting libvmi to krogoth branch.
>
> Your help is much appreciated.

Hector,

So what would have happened is krogoth was branched and then at some
later time a commit was applied to master which added the
libvmi_git.bb recipe. So start by using git to identify this commit,
you can do this while on the krogoth branch still
ie.: git log master -- ./recipes-extended/libvmi/libvmi_git.bb

This will identify commit e2ab59ec3e4b547da635cda725090d42126dcfd2 as
the commit which brought in the libvmi_git.bb recipe, so cherry-pick
it
ie: git cherry-pick e2ab59ec3e4b547da635cda725090d42126dcfd2

Now attempt to build it 'bitbake libvmi', as you have indicated this
most likely fail as libvirt will require libxl. DO NOT port the
libvirt recipe from master back to krogoth, libvirt has been around
for ages in meta-virtualization and libvmi does not have a version
dependency on libvirt. Instead when you inspect the libvirt recipe
already present on the krogoth branch you will see that libxl is a
dependency we can control, we need to ensure we have a suitable
PACKAGECONFIG for libvirt AND that "xen" is not set in the
DISTRO_FEATURES. By default neither of these are set so without having
access to your build I don't know where you are setting either of
these, you will have to use bitbake -e libvmi or similar to find out
where your build is setting either of these and mitigate against this.

Try the above and follow up and we can then move on with any other
bits. It is important that you can prep the backport as you have the
krogoth build ready to go along with a usecase to test the backport,
something Bruce will not have.

Regards,
Mark



>
> Please let me know if possible.
>
> Thanks
>
> --
> Hector
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

