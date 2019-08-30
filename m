Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D250CE00C78; Thu, 29 Aug 2019 21:29:02 -0700 (PDT)
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
	*      [209.85.208.175 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB372E00B7A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:29:01 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id x4so5155882ljj.6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=87xfJzkoYT5W2WUFCQz1hsGA7NXDvDacvXQfwh4TVi0=;
	b=Ig0hkH6FfXKYW0T02lZkjig6HvAF/mCoyMP1M3wZJ+4sfnBLYvhENc/C/oR70SA0r/
	w5iEL0Z+7bOwpPLPdJLVxphQfO1SVhgQ/mgb3HZzjeRSxEbluh8WnFZFoFKnMePheBe4
	rbU7KBy0/NrDiKiFn1vgimXmcZMOSfaV3DMeDRxKr1a739pAjEWBWdFONWJgGXCgD2SS
	wFrji3HUUHcrMvPv4M+N1LjkM1Q0Bg3L9HOh6TgC7cHWu0VxEVz7oDSidPXGjyAdJ3Aw
	MtMOjhC10bxYTqXI8sFR4oX9WJlZej/Si0UX1ALrpTtFOhe/KSPAC9BnzAXV328YBXH5
	vboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=87xfJzkoYT5W2WUFCQz1hsGA7NXDvDacvXQfwh4TVi0=;
	b=emV7YYEuMzPY8RA4DawY1EU6xviBn7Vr8JY3BALgh7rsiELzFDW60qh0xhFZlwid/y
	y4iLIma5wIRVmJimTBqKE4omSXuStA2kEtUtqJOo/l9ON15wnoU+O9AzOvnkKIudkUIo
	BJe8D3+IGgpQH+jOx4C7j/NiC9GkbAcidD/SfLe22SGLc6dl8lujYUnglsJNhOuGPruz
	bxgKELA+CPbDh6goqU+cclZ+D/jdNYaYrGBXGXQ3E5L8fJBiLwHkHPDhmhlHM1bAv3g3
	BTSOXrs9e9fnb9q7jUpcrYoqR6TC4uCrdWplGtc3S6BrcS5m2a89KNTaInsS6ej26sV+
	sssA==
X-Gm-Message-State: APjAAAWBY6bDhGfjHPxFX1LCLtj+tBJmMLkmTp/lXbyU+HcUuSxz6JHK
	7xv/0rY1I4pC7HYoNC8VdjP4FpYM4omRVfJmZsSEJZe2
X-Google-Smtp-Source: APXvYqzVaORc5zUDNOfm7IcGE9czws00IZk43ujvyzXY1C1TXgMjwQg0SYZYXP9PVUVAyVdIXiYOV7ClvthEv5Yaz8A=
X-Received: by 2002:a05:651c:1111:: with SMTP id
	d17mr7154032ljo.87.1567139340584; 
	Thu, 29 Aug 2019 21:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190829064137.38267-1-Qi.Chen@windriver.com>
In-Reply-To: <20190829064137.38267-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 00:28:49 -0400
Message-ID: <CADkTA4OZd6p7c0gDdc9LALrdWhn15NqQAMBZ_0QuwD1sEM=5RA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] ceph: remove fuse related services as WITH_FUSE is OFF
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
X-List-Received-Date: Fri, 30 Aug 2019 04:29:02 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Aug 29, 2019 at 2:41 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> We have WITH_FUSE to set to OFF. We should not install any ceph-fuse
> units as they are using ceph-fuse.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-extended/ceph/ceph_14.1.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/ceph/ceph_14.1.0.bb b/recipes-extended/ceph/ceph_14.1.0.bb
> index 55a6d7d..18a324a 100644
> --- a/recipes-extended/ceph/ceph_14.1.0.bb
> +++ b/recipes-extended/ceph/ceph_14.1.0.bb
> @@ -32,8 +32,6 @@ SYSTEMD_SERVICE_${PN} = " \
>          ceph-osd@.service \
>         ceph-osd.target \
>          ceph.target \
> -       ceph-fuse@.service \
> -       ceph-fuse.target \
>         ceph-rbd-mirror@.service \
>         ceph-rbd-mirror.target \
>         ceph-volume@.service \
> @@ -77,6 +75,8 @@ do_install_append () {
>         mv ${D}${libexecdir}/systemd/system ${D}${systemd_unitdir}
>         mv ${D}${libexecdir}/ceph/ceph-osd-prestart.sh ${D}${libdir}/ceph
>         mv ${D}${libexecdir}/ceph/ceph_common.sh ${D}${libdir}/ceph
> +       # WITH_FUSE is set to OFF, remove ceph-fuse related units
> +       rm ${D}${systemd_unitdir}/system/ceph-fuse.target ${D}${systemd_unitdir}/system/ceph-fuse@.service
>  }
>
>  FILES_${PN} += "\
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

