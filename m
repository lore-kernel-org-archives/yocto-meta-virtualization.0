Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60CB4E009D2
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Mar 2014 08:18:12 -0800 (PST)
Received: by mail-lb0-f170.google.com with SMTP id s7so4814706lbd.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 03 Mar 2014 08:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yONz62/mxPI0iNEp1d+Y7fBEyh76agMtUH2ueKQsi6M=;
	b=gkUZYTRDStMwrPk+CN24EkXsvJkMDqsPKtU2i3ZeLBdIna8zgfenYctjMHkr090HGv
	Sk/jpCL/vvjB7srYBgCUZQZIQG9BwN8swsyL1/WMo7G3HL6QmqrpbY8pWDvg8IJeaP6W
	Qv4a7XjNdDeymsDM8v3wQDIO6MCwDgVVRbS6MZh3XhioVirdj2zJsaayOtTK3h2aONzw
	BZ6WdT9+D987M6QfOuUw/EsuKuz9mJ6mFyHVh3kEbcYJMaEVH6uY5miY9y1oFsM1EKuo
	u3BKvedPj8NQIghNnpXWIdei3ubeCBPl+LGF/3EWrE57n1brVAxNhDvyKhCXsXkJP3+/
	Ebtg==
MIME-Version: 1.0
X-Received: by 10.112.173.6 with SMTP id bg6mr22389926lbc.17.1393863490901;
	Mon, 03 Mar 2014 08:18:10 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Mon, 3 Mar 2014 08:18:10 -0800 (PST)
In-Reply-To: <1393848618.1668.9.camel@sestows040.enea.se>
References: <1393500786-16877-1-git-send-email-josep.puigdemont@enea.com>
	<CADkTA4M1qW4ZTzieAZo=Pb+Ybdkw9FvSXw1qDQpzo-KWC10M8A@mail.gmail.com>
	<1393848618.1668.9.camel@sestows040.enea.se>
Date: Mon, 3 Mar 2014 11:18:10 -0500
Message-ID: <CADkTA4N3y7Ly-uxSUdqt0qEx=NuiUGTTB0jz4p32kqjC1xgwqw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Update lxc recipe to 1.0.0
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
X-List-Received-Date: Mon, 03 Mar 2014 16:18:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 3, 2014 at 7:10 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> On Thu, 2014-02-27 at 14:42 -0500, Bruce Ashfield wrote:
>> On Thu, Feb 27, 2014 at 6:33 AM, Josep Puigdemont
>> <josep.puigdemont@enea.com> wrote:
>> > LXC 1.0 was released last week [1], this is an update of the lxc recipe to use
>> > the latest stable version.
>> > There are not many changes from the 0.9.0 recipe, just the hashes and the fetch
>> > url. Some patches have been removed since they have already been included
>> > in lxc-1.0.0.
>>
>> Nice to stay so quickly up to date :)
>>
>> The series looks good to me, did you do any runtime testing to show basic
>> functionality was still intact ? I assume it is, but I didn't ask once, and was
>> bitten by a init error!
>
> Hi Bruce!
> Sorry I didn't answer earlier, I was away without email until today.
> Thank you for applying the patch!

No worries. I went ahead and merged it, since a quick check confirmed
the details of your commit.

>
> Regrettably I did not do very thorough testing, I used it to
> start/stop/execute containers, but didn't use lxc-create for instance
> (most of the previous patches were related to the templates used by
> lxc-create). I'll give it a go if I have time tomorrow (I don't think
> I'll be able to do it today), unless you've already done so.

I did do a basic build and smoke test, but getting a bit more testing
would be ideal :)

Bruce

>
> Thanks!
>
> /Josep
>
>>
>> Bruce
>>
>> >
>> > [1] https://lists.linuxcontainers.org/pipermail/lxc-users/2014-February/006260.html
>> >
>> > Josep Puigdemont (1):
>> >   Update Linux Containers to lxc-1.0.0
>> >
>> >  .../lxc-0.9.0-always-strdup-rootfs-mount.patch     |   27 --------
>> >  ...xc-0.9.0-check-when-bind-mounting-libdirs.patch |   44 ------------
>> >  .../lxc-0.9.0-configure-allow-subdir-objects.patch |   35 ----------
>> >  ...0.9.0-disable-udhcp-from-busybox-template.patch |   24 -------
>> >  ...c-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch |   29 --------
>> >  ...-chpasswd-functionality-for-busybox-hosts.patch |   70 --------------------
>> >  ...tdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch |   49 --------------
>> >  .../files/lxc-0.9.0-use-susv3-head-arguments.patch |   46 -------------
>> >  ...1.0.0-disable-udhcp-from-busybox-template.patch |   24 +++++++
>> >  recipes-containers/lxc/lxc_0.9.0.bb                |   69 -------------------
>> >  recipes-containers/lxc/lxc_1.0.0.bb                |   62 +++++++++++++++++
>> >  11 files changed, 86 insertions(+), 393 deletions(-)
>> >  delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-mount.patch
>> >  delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-check-when-bind-mounting-libdirs.patch
>> >  delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-configure-allow-subdir-objects.patch
>> >  delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox-template.patch
>> >  delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch
>> >  delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch
>> >  delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch
>> >  delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-use-susv3-head-arguments.patch
>> >  create mode 100644 recipes-containers/lxc/files/lxc-1.0.0-disable-udhcp-from-busybox-template.patch
>> >  delete mode 100644 recipes-containers/lxc/lxc_0.9.0.bb
>> >  create mode 100644 recipes-containers/lxc/lxc_1.0.0.bb
>> >
>> > --
>> > 1.7.10.4
>> >
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

