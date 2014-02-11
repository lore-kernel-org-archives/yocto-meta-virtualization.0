Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28729E00799
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Feb 2014 12:48:23 -0800 (PST)
Received: by mail-la0-f42.google.com with SMTP id hr13so6446189lab.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Feb 2014 12:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=ErK5q2LaN+pzCUmFUjJVOWvjCez28c/wjGP34Gv/dyE=;
	b=pSpdbs4ZM5N6vizG7vF14Rrhe9zYBTN3gJfMuy3vSh+OiSLrAEJL1dLMq6MfHPYjeY
	TxxTAdOeUmEajN2cJ1Ky/b8iRsG0iaOubxu/rYY5g6d5jsXSfXJfW0lnIgHpr4SPouRJ
	3d6Yo2CMFBFydEf6rArob1G7HEJOLa+s8vXOITQAwG14qRCU2imms+X9PLq+Usd/Dh9X
	LV3iJv/Uxy3DsehMgB0CsWNHc70Jt0tq/lHyxmEvZai654sGKZsMFGuTrotAFNLJlwq+
	iemkuFMv4PRaluYJEWTN+dbh7RHfcboE8VjVFknNSDGfl708z5M/U0tqOszxgf7tkVcx
	BQMg==
MIME-Version: 1.0
X-Received: by 10.152.26.2 with SMTP id h2mr85645lag.75.1392151702385; Tue, 11
	Feb 2014 12:48:22 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Tue, 11 Feb 2014 12:48:22 -0800 (PST)
In-Reply-To: <CAAKB1h2NREQGDbMNGN_awsYMQe0qeKzJ5SCYie0QNFmt9EKnbg@mail.gmail.com>
References: <1392037746-27912-1-git-send-email-josep.puigdemont@enea.com>
	<52F8DCE4.8050404@enea.com>
	<CADkTA4Mj0VceoZGxYFR7UN7Jx9EkGccw_Y_-OvaYDOOEp-tXKQ@mail.gmail.com>
	<CAAKB1h2NREQGDbMNGN_awsYMQe0qeKzJ5SCYie0QNFmt9EKnbg@mail.gmail.com>
Date: Tue, 11 Feb 2014 15:48:22 -0500
Message-ID: <CADkTA4OxZmdBr8+VrJ2cpn7BJDgad0jGqWi1NEY--25AjVMKRg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: David Nystrom <david.c.nystrom@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: always strdup lxc.rootfs.mount
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
X-List-Received-Date: Tue, 11 Feb 2014 20:48:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2014 at 2:10 PM, David Nystrom
<david.c.nystrom@gmail.com> wrote:
>
> On 10 Feb 2014 17:23, "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
>>
>> On Mon, Feb 10, 2014 at 9:06 AM, David Nystr=F6m <david.nystrom@enea.com=
>
>> wrote:
>> > On 2014-02-10 14:09, Josep Puigdemont wrote:
>> >>
>> >> The reason is that the generic code which handles reading
>> >> lxc.rootfs.mount
>> >> always frees the old value if not NULL. So without this setting
>> >> lxc.rootfs.mount =3D /mnt causes segfault.
>> >>
>> >> This is a backport for lxc-0.9.0 (dora) of the same fix found in
>> >> upstream's master, see commits 54c30e29 and 53f3f048.
>> >>
>> >> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
>> >> ---
>> >>   .../lxc-0.9.0-always-strdup-rootfs-mount.patch     |   27
>> >> ++++++++++++++++++++
>> >>   recipes-containers/lxc/lxc_0.9.0.bb                |    1 +
>> >>   2 files changed, 28 insertions(+)
>> >>   create mode 100644
>> >> recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-mount.pat=
ch
>> >>
>> >> diff --git
>> >>
>> >> a/recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-mount.p=
atch
>> >>
>> >> b/recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-mount.p=
atch
>> >> new file mode 100644
>> >> index 0000000..3e299d2
>> >> --- /dev/null
>> >> +++
>> >>
>> >> b/recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-mount.p=
atch
>> >> @@ -0,0 +1,27 @@
>> >> +diff --git a/src/lxc/conf.c b/src/lxc/conf.c
>> >> +index 6b3f318..2f8b9e6 100644
>> >> +--- a/src/lxc/conf.c
>> >> ++++ b/src/lxc/conf.c
>> >> +@@ -2072,7 +2072,12 @@ struct lxc_conf *lxc_conf_init(void)
>> >> +       new->console.slave =3D -1;
>> >> +       new->console.name[0] =3D '\0';
>> >> +       new->maincmd_fd =3D -1;
>> >> +-      new->rootfs.mount =3D default_rootfs_mount;
>> >> ++      new->rootfs.mount =3D strdup(default_rootfs_mount);
>> >> ++      if (!new->rootfs.mount) {
>> >> ++              ERROR("lxc_conf_init : %m");
>> >> ++              free(new);
>> >> ++              return NULL;
>> >> ++      }
>> >> +       new->kmsg =3D 1;
>> >> +       lxc_list_init(&new->cgroup);
>> >> +       lxc_list_init(&new->network);
>> >> +@@ -3084,7 +3089,7 @@ void lxc_conf_free(struct lxc_conf *conf)
>> >> +               return;
>> >> +       if (conf->console.path)
>> >> +               free(conf->console.path);
>> >> +-      if (conf->rootfs.mount !=3D default_rootfs_mount)
>> >> ++      if (conf->rootfs.mount)
>> >> +               free(conf->rootfs.mount);
>> >> +       if (conf->rootfs.path)
>> >> +               free(conf->rootfs.path);
>> >> diff --git a/recipes-containers/lxc/lxc_0.9.0.bb
>> >> b/recipes-containers/lxc/lxc_0.9.0.bb
>> >> index 8f7736b..fceefff 100644
>> >> --- a/recipes-containers/lxc/lxc_0.9.0.bb
>> >> +++ b/recipes-containers/lxc/lxc_0.9.0.bb
>> >> @@ -26,6 +26,7 @@ SRC_URI =3D
>> >> "http://linuxcontainers.org/downloads/${PN}-${PV}.tar.gz \
>> >>
>> >>
>> >> file://lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hos=
ts.patch
>> >> \
>> >>       file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
>> >>       file://lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch \
>> >> +    file://lxc-0.9.0-always-strdup-rootfs-mount.patch \
>> >>         "
>> >>   SRC_URI[md5sum] =3D "8552a4479090616f4bc04d8473765fc9"
>> >>   SRC_URI[sha256sum] =3D
>> >> "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b654120"
>> >>
>> >
>> > Reviewed-by: David Nystr=F6m <david.nystrom@enea.com>
>> >
>> > Minor nitpicking, please add the branch name in the subject as:
>> > [dora][PATCH]blah for future patches, unless its for master.
>>
>> Agreed. But in this case, don't we also want this on master ? The dora a=
nd
>> master version of lxc are the same, so doesn't this fix apply to both
>> branches ?
>
> Yes, you are correct.
> Misunderstanding on my behalf.

I wouldn't say that, since the patch was definitely intended for dora (with
it's context), but the reject was trivial to resolve. I did a build
test on master
and all looks fine.

So I went ahead and pushed this to dora and master.

Bruce

>
> Br,
> David
>
>> Bruce
>>
>> >
>> > Br,
>> > David
>> >
>> >
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

