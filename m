Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02CF9E00C75; Thu,  7 Feb 2019 08:14:41 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.175 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02EC5E00C6D
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Feb 2019 08:14:39 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id g11-v6so373153ljk.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 Feb 2019 08:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=q3m0lZIZwsgMkvwO62Fyl+/wZyJNOLbSTVViUIQWkjw=;
	b=jRUEn3jlvib4flyR8ByEiRcmHe1KS+j6VXdth2PsyinyKvihCQ5DkxxvXaARQ3r52u
	YKHsYcSMVE7TF5UdRz0qD7KebX7JUyj1OV6Rxbi44Qt2DroB1+s4MYsiD68CdQVj0ZFY
	ujDiM3il+gUPblHwjkONzWgKZeXziYFeABbwC2riVAJsLdWeNaMZJ2xkUh3VZGcnZgTd
	eKOyI5ggT5sYQvUO2CrCw4KwfWJN7Q48m6+xdjdr1Tfl/OvDUG7xDZ8zxubkZ8uEXd4M
	LHip3rya5bzBJk/7qdK5toJnPVyXZ+M+delqzWbOCULciO7gfPfpam9Na1SKffGTCnjM
	XFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=q3m0lZIZwsgMkvwO62Fyl+/wZyJNOLbSTVViUIQWkjw=;
	b=mCVrdQwoXyCzAHBzKdi9fVjHunFB2DRLk8jmqcaoyU+0gwWHUnKlPo/lO/lsYeA3M9
	zUp57BIOai76UhvtarKfc1oVY9yYwM4VusagpCKAgmE/rvkCacBuazOUr4qr+oh4lLbT
	cmG3TpXxtjZA+r4qGiXV8KlF39RUAKYDXNIC86PM8ox2f6Kp0OxZrgYQOFYWA+z64RTc
	kMjRQxMGF8OTTOD97LcdJNUaKKhx6wAwY8kPgWsXBz6o3Mm+F1TBDRVIFj5kVtLEpfYO
	f8TsyCZtVdXaP3XcOugkpLHtDMtao1M3X5aZDX8ZXMSZDngMF6WuwJ74Zo+DgR5AOKgJ
	C1gg==
X-Gm-Message-State: AHQUAuYHyQA7KGEKn0txsx6UVNW3XbwFOCB66egZaYS0lUOSNe1m2Ddf
	LV11cf5o8PkaUn3TUCCg2H1hBY+PxtT2xe7W1MZLaids
X-Google-Smtp-Source: AHgI3IYb38eEU1wM5gqOus1XdqFXbLr60lG92gEdm20O8TYTNbC2Jv+G7LgyOWaajYXA0o5Bg3bnKYAvdy0yzBTMDqQ=
X-Received: by 2002:a2e:4784:: with SMTP id
	u126-v6mr10315784lja.124.1549556078590; 
	Thu, 07 Feb 2019 08:14:38 -0800 (PST)
MIME-Version: 1.0
References: <2a468100b7c94734bcb79d6ddb55c141@luxoft.com>
	<CADkTA4MDqmmeko0DmpZ1D3qeJUWMue2BJGY4Txyf3zCofmXV8g@mail.gmail.com>
	<09262a4a1f4f4e0dae6f47b099f4946c@luxoft.com>
In-Reply-To: <09262a4a1f4f4e0dae6f47b099f4946c@luxoft.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 7 Feb 2019 11:14:26 -0500
Message-ID: <CADkTA4NUSEdO73VmZSE+=GxZK_xR6tM4s0S--w-FBaoDTQrOHw@mail.gmail.com>
To: "Nordqvist, Therese" <TNordqvist@luxoft.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: LXC 3.1 in thud?
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
X-List-Received-Date: Thu, 07 Feb 2019 16:14:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 7, 2019 at 5:42 AM Nordqvist, Therese <TNordqvist@luxoft.com> w=
rote:
>
> Hello,
>
>
> I have looked through the release notes for both the 3.0.3 and the 3.1.0 =
releases.
>
> We have tested both the thud and master branches for meta-virtualization =
and it turns out we do not need the LXC 3.1.0 features or the 3.0.3 bugfixe=
s for our project (at this time).
>
> It is more of a case of "nice to have the same version of LXC on both thu=
d and master" for us.
>
>
> I am including a list of changes for the LXC releases in case someone els=
e sees something they need.
>

The list of features doesn't look like a problem to me. I did do some
preliminary cherry picks to thud and was just waiting to see what you
found on this front.
If there are no complaints in the next few days, I'll go ahead and
push the version/bug fix bumps.

Bruce

>
> Highlights for 3.0.3 (bugfixes):
>
>  * Improved our default build flags to make use of compiler hardening
>  * Added support for netlink strict property checking on newer kernels
>  * Added support for new netlink interface/address netns API
>  * Added handling of the kernel keyring on startup
>
> Summary of features added in 3.1.0:
>
>  * enable various remount options with AppArmor
>
>  * support NETLINK_DUMP_STRICT_CHK
>
>  * allocate new keyring on startup
>
>  * full cgroup2 support
>
>  * implement efficient way to retrieve network devices and addresses from=
 containers
>
>  * introduce lxc_has_api_extension() into the API
>
>  * add lxc.cgroup.relative configuration key
>
>  * allocate new network namespace identifier on startup
>
>  * add lxc.rootfs.managed configuration key
>
>  * removal of all VLAs
>
>  * AppArmor profile generation
>
>  * add mount injection api
>
>  * add lxc.monitor.signal.pdeath configuration key
>
>  * build a shared and static liblxc library
>
>  * adapt to mknod() changes in Linux Kernel 4.18
>
>  * use execveat() to execute application containers
>
>  * enable per-thread container name prefix when logging
>
>  * refactor cgroup handling
>
>  * raise ambient capabilities when running hooks
>
>  * allow to mount /sys rw in unprivileged containers
>
>  * add strlcpy() and strlcat() and deprecate strncpy() and strncat()
>
>  * compiler based hardening
>
>  * thread-safety improvements
>
>  * support application containers without uid 0 in the container
>
>  * support devpts mounts on kernels without gid mount option
>
>
>
> Best regards,
> Therese Nordqvist
> Software Engineer
>
> Luxoft Sweden AB
> =C3=96stra Hamngatan 16
> 411 09 Gothenburg
> Sweden
>
> M: +46 732 332464
> E: TNordqvist@luxoft.com
>
> luxoft.com
>
> Registered Office Gothenburg, Sweden
> Registration No. 556780-4199
>
>
> ________________________________
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Sent: Wednesday, February 6, 2019 10:01 PM
> To: Nordqvist, Therese
> Cc: meta-virtualization@yoctoproject.org
> Subject: Re: [meta-virtualization] LXC 3.1 in thud?
>
> On Tue, Feb 5, 2019 at 10:22 AM Nordqvist, Therese
> <TNordqvist@luxoft.com> wrote:
> >
> > Hello,
> >
> >
> > I'm working in a project which uses meta-virtualization (http://pelux.i=
o), do you know if there are any plans to include the LXC bump to 3.1.0 in =
the thud branch?
>
> There currently aren't any plans to do a version bump in Thud. We tend
> to leave the versions as-is in the maintained branches.
> It looks like thud is missing the 3.0.3 and 3.1.x bumps that we have
> in master, so there are at least two patches missing.
>
> That being said, the missing version bumps are relatively minor and
> are bug fixes/small changes to the project.
>
> What feature are you looking for in particular ? Can you summarize the
> changes between the versions and send
> it to the list ? That way everyone can see the requested change to the
> released branch and object if they think
> there will be impacts.
>
> Cheers,
>
> Bruce
>
> >
> > https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?=
id=3D2387a8876e4aaa52143a623ae5000cf064e55a64
> >
> >
> > If you are interesting in our github repo: https://github.com/Pelagicor=
e/pelux-manifests
> >
> >
> > Best regards,
> > Therese Nordqvist
> > Software Engineer
> >
> > Luxoft Sweden AB
> > =C3=96stra Hamngatan 16
> > 411 09 Gothenburg
> > Sweden
> >
> > M: +46 732 332464
> > E: TNordqvist@luxoft.com
> >
> > luxoft.com
> >
> > Registered Office Gothenburg, Sweden
> > Registration No. 556780-4199
> >
> > ________________________________
> >
> > This e-mail and any attachment(s) are intended only for the recipient(s=
) named above and others who have been specifically authorized to receive t=
hem. They may contain confidential information. If you are not the intended=
 recipient, please do not read this email or its attachment(s). Furthermore=
, you are hereby notified that any dissemination, distribution or copying o=
f this e-mail and any attachment(s) is strictly prohibited. If you have rec=
eived this e-mail in error, please immediately notify the sender by replyin=
g to this e-mail and then delete this e-mail and any attachment(s) or copie=
s thereof from your system. Thank you.
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> ________________________________
>
> This e-mail and any attachment(s) are intended only for the recipient(s) =
named above and others who have been specifically authorized to receive the=
m. They may contain confidential information. If you are not the intended r=
ecipient, please do not read this email or its attachment(s). Furthermore, =
you are hereby notified that any dissemination, distribution or copying of =
this e-mail and any attachment(s) is strictly prohibited. If you have recei=
ved this e-mail in error, please immediately notify the sender by replying =
to this e-mail and then delete this e-mail and any attachment(s) or copies =
thereof from your system. Thank you.
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

