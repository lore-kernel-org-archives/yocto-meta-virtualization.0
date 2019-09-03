Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6A303E00D67; Tue,  3 Sep 2019 12:58:27 -0700 (PDT)
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
	*      [209.85.167.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72569E0098A
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 12:58:26 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id w6so8527924lfl.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 12:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PN1UI/h1dKpwmoJsdJFhzsLvbrkx2gmnWBOjzlTEr1g=;
	b=Nn3kiVf0euFx1nehMVWtxg6qq9yCkoV0bi9Dx7CfhdYVGSZeEQsTIWuIvdr2G6fj/s
	qK281U4sE8g4V6m2QisLrbxDjYwaJxJ8ikKrS4SJAYatNxTVrnEHOkIGJ4Dd+HNBNcq7
	wXWTSEdFF/xmbRliPRKqOyOoMclJE+b4zyb9qHswwQtxaa5q/wmd8beuzk/5mLEbe9Ul
	mLkuc4PsNhQy/sQtBzXLMSSsApZPIbApjIt2HA9OrUjxWtunGZguAXqIRBjMswtUS14D
	AdI8jpwMMFaE+6mQCZGne6cMBBgg3GjR25f2hr215O/zG1+nwvYUEIeaDH3xi1PXHCR3
	FQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PN1UI/h1dKpwmoJsdJFhzsLvbrkx2gmnWBOjzlTEr1g=;
	b=fyRvlIDNLkNQZ/dlQV1FaWb654gC34i1K2ACGVEF+11zalIWNOd63qEFzrpHvq9XnW
	kvMNFFKIwSc7AW2CV8PIo3KRoUG21KOafRIVuxwIIpY9DyXhShXgLamnxy8+1QyBmM9g
	HuZ57daL8Om8yyIORrJnptQfqgVPD6M1eEIMlc6Gg+b5ZdtmOkU3e/bfaZ+v08depw8G
	wV5bLUJCJV23+7IXPSoS8tQTIocS5JGRidP4m8lWfLquLPxd1Ts5NxsNuHhqTO51BNQ/
	o1N4/Klrufu8HdK7hJRsnrxIyeq/WdNe0c4ZibBok4u8XtFDj1olu3AAyxBqfxuXBEe2
	TeHA==
X-Gm-Message-State: APjAAAWuZ3i/fISRfL523jI2OG8z8zNSpHhTfvXTmFbH8tGQUo97g9zk
	4Cx9KCOiWjA7ozKu7n5G5zE70GQ/vUwZUJpCd3szVcDy
X-Google-Smtp-Source: APXvYqzyuVvkO5qFT6knOqAvnAsj5vHo+VR2+b7GoBfso5tw0DhEJjPLjT/HPMpL9tcV7gzBEKIV54NRKtGtiv7GBaQ=
X-Received: by 2002:ac2:5a07:: with SMTP id q7mr12269410lfn.177.1567540705268; 
	Tue, 03 Sep 2019 12:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190830091737.36415-1-Qi.Chen@windriver.com>
In-Reply-To: <20190830091737.36415-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 15:58:14 -0400
Message-ID: <CADkTA4NRzku0rP1FJr0nghCbdw_FXaet7hNhT3L7-6y05k1ASA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] glusterfs: fix RDEPENDS of glusterfs-geo-replication
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
X-List-Received-Date: Tue, 03 Sep 2019 19:58:27 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Aug 30, 2019 at 5:21 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> It should rdepend on python3-core and bash. Otherwise, we get the
> following QA issue.
>
>   glusterfs-6.1-r0 do_package_qa: QA Issue: /usr/libexec/glusterfs/peer_georep-sshkey.py contained in package glusterfs-geo-replication requires /usr/bin/python3, but no providers found in RDEPENDS_glusterfs-geo-replication? [file-rdeps]
>   glusterfs-6.1-r0 do_package_qa: QA Issue: /usr/libexec/glusterfs/set_geo_rep_pem_keys.sh contained in package glusterfs-geo-replication requires /bin/bash, but no providers found in RDEPENDS_glusterfs-geo-replication? [file-rdeps]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-extended/glusterfs/glusterfs.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
> index 40a3922d..ebfc3245 100644
> --- a/recipes-extended/glusterfs/glusterfs.inc
> +++ b/recipes-extended/glusterfs/glusterfs.inc
> @@ -119,7 +119,7 @@ PACKAGES += "${PN}-rdma ${PN}-geo-replication ${PN}-fuse ${PN}-server \
>  RDEPENDS_${PN} += "python3-core python-json python-ctypes bash"
>  RDEPENDS_${PN}-ocf += "bash"
>  RDEPENDS_${PN}-server += "bash"
> -RDEPENDS_${PN}-geo-replication += "python3"
> +RDEPENDS_${PN}-geo-replication += "python3-core bash"
>
>  FILES_${PN}-dbg += "${libdir}/glusterfs/${PV}/*/.debug \
>                      ${libdir}/glusterfs/${PV}/*/*/.debug \
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

