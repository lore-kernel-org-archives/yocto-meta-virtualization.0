Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.1183.1574895620027147484
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Nov 2019 15:00:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WxMJgfRZ;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DCE6CE01082; Wed, 27 Nov 2019 15:00:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.208.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45963E0107C
	for <meta-virtualization@yoctoproject.org>; Wed, 27 Nov 2019 15:00:19 -0800 (PST)
Received: by mail-ed1-f65.google.com with SMTP id a67so21052915edf.11
        for <meta-virtualization@yoctoproject.org>; Wed, 27 Nov 2019 15:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iT0nvbgtOr3q3En+7kfj6x1axrWt874TY5wCvsmbqjA=;
        b=WxMJgfRZLr1QpIpEqXqybNdayyHZ9q88eDRyvaKH2G8xBvL/RA3oeWIsTh1isbipji
         OD8EGYZqJWTbTz9qnJSpJ+JIlxqmWaYHQuahMUlagSELy0v2tJyTDYHLROYoZGsXBjCx
         5ETcOR3jLZEdQZIMrRcmnIbZOwPgV+3JyLzQWOFo8GSBjek4XOh10VCfJhQt4OYU88jd
         cvSSgK0ziKlBTmhXw1qcXxvR6lPmpYm2SMwwvi1/A/VhjZYV/1DJe0Sdab0wxNaPfLiz
         GL0+XmYox3jsXxm15xvuFHc4hc09QrcWqdkMj+0U7uVSCz5FHc5LD+LjuPyZxuYVBExs
         2mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iT0nvbgtOr3q3En+7kfj6x1axrWt874TY5wCvsmbqjA=;
        b=XWIrZ2/cwQqrY0H66iGcAZ5QprEqYUPd7KrKVLnz13EL68vx95t6aFD4x0cIot7ofi
         WT5diS+N1Wor5JQzQ3If2ouegDGSsT9U99SAIdE6L18gWUMDXXYgMIKwFYXLvD3NLIAR
         sSkVUVu4jRg83atMMRHLYuc1UnXWChXxb5k57GP47+BiHFFVCvcdfxOSgTt4KDWjfM52
         AvdJImb7LjvNKC9mhogUl5NV2oiTbX6TskVpXkYPWtNHo7llW4cMpC0vS1/qsOrm/8px
         eBTsVahgVrWhRb76UAf7VUQeDYo28ZowX+yS5Cpalvh/eUqIHzevWdlQO48WaUQTuUpx
         XJUA==
X-Gm-Message-State: APjAAAVUrjmjvV8MXg6obiAf203LWxWMXSbzUIxmubru0r1a6vundNC3
	vaCvWctMzxZ1NgIuNxHffsUFsuu+0Pyjg/m6IVE=
X-Google-Smtp-Source: APXvYqwvkszNCDlXx557/GjPLgy2oWiGVC9vSmlyqyf5dw1WnMuDCM9amK2PpS34XkkszlCFievcz7A4TI4UAu8ohZA=
X-Received: by 2002:a17:906:a841:: with SMTP id dx1mr10066937ejb.259.1574895618079;
 Wed, 27 Nov 2019 15:00:18 -0800 (PST)
MIME-Version: 1.0
References: <1574853651-66328-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1574853651-66328-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 27 Nov 2019 18:00:06 -0500
Message-ID: <CADkTA4N3yedk61fPUpzKCBC_ihzuV=TS_8f1ARiPgs4wMqEgqw@mail.gmail.com>
Subject: Re: [meta-virtualization][zeus][PATCH] python-heat: Fix do_package_qa error
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

All the QA patches are now merged.

Bruce

On Wed, Nov 27, 2019 at 6:21 AM zhengruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Fix the error as follows:
>
> ERROR: python-heat-5.0.0+gitAUTOINC+4348b7abab-r0 do_package_qa: QA Issue: /usr/bin/heat-db-setup contained in package heat-engine requires /bin/bash, but no providers found in RDEPENDS_heat-engine? [file-rdeps]
> ERROR: python-heat-5.0.0+gitAUTOINC+4348b7abab-r0 do_package_qa: QA Issue: /usr/lib/python2.7/site-packages/heat/cloudinit/boothook.sh contained in package python-heat requires /bin/bash, but no providers found in RDEPENDS_python-heat? [file-rdeps]
> ERROR: python-heat-5.0.0+gitAUTOINC+4348b7abab-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-heat_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-heat_git.bb b/meta-openstack/recipes-devtools/python/python-heat_git.bb
> index 2cf7ce4..3b4998f 100644
> --- a/meta-openstack/recipes-devtools/python/python-heat_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-heat_git.bb
> @@ -243,9 +243,10 @@ RDEPENDS_${PN} += " \
>          python-zaqarclient \
>          python-requests \
>          python-six \
> +        bash \
>         "
>
> -RDEPENDS_${SRCNAME}-engine = "${PN} ${SRCNAME}-templates ${SRCNAME}-common postgresql postgresql-client python-psycopg2 tgt ${SRCNAME}-cfn"
> +RDEPENDS_${SRCNAME}-engine = "${PN} ${SRCNAME}-templates ${SRCNAME}-common postgresql postgresql-client python-psycopg2 tgt ${SRCNAME}-cfn bash"
>  RDEPENDS_${SRCNAME}-api = "${SRCNAME}-engine"
>  RDEPENDS_${SRCNAME}-api-cfn = "${SRCNAME}-engine"
>  RDEPENDS_${SRCNAME}-setup = "postgresql sudo ${SRCNAME}-engine"
> --
> 2.7.4
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4756): https://lists.yoctoproject.org/g/meta-virtualization/message/4756
> Mute This Topic: https://lists.yoctoproject.org/mt/62496472/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
