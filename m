Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D447DE00C59; Thu,  2 Nov 2017 16:30:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.175 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.175 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2E57E00C44
	for <meta-virtualization@yoctoproject.org>;
	Thu,  2 Nov 2017 16:30:30 -0700 (PDT)
Received: by mail-qk0-f175.google.com with SMTP id y23so1331151qkb.10
	for <meta-virtualization@yoctoproject.org>;
	Thu, 02 Nov 2017 16:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m/zY63Burls53Vm9NXsW2iob7zlWih49jqnNL7HSFDw=;
	b=F0y+jrYEBLwa6+DC8c2aoHGChyJytkJnUqvaqftjN3OFgVyy97ZoU20jIDLKgdaJJB
	1EOVmTFyXMhZ/ofNRSATdf8EP+dDZA3unhjRsjwNYodt5uOYYlxuQZf+6Kv/pFh5/ooD
	T+dPXD0y4O2szqUOHIWhK8bf+JdDX0p5L1aNvwbtCi7VjF9VVj9cwF1KebIO+EgYJ4Lt
	dHfkJTll6yXE+WTHhI2VUl/1pHkVAp/vcp2xDVw7lMvfJdoBZ7909lrPLhJRuh9b/Dim
	j5Jdq27jsbv/cEKiorYKSiOIKLLsxi2NETijLpXPYEX3pS9eBex4Tir6GOLiT1z0eCEM
	HUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m/zY63Burls53Vm9NXsW2iob7zlWih49jqnNL7HSFDw=;
	b=m8AalCn4gpZkMsT3YKbgrYk21ZVOAKKlKRyeIZvQN8kfvCE+0kpTcGmRAEhQJwXggb
	5ewq/pK6OjykEYY5CFCgjedWmS482bev53m/KaIAku9QVTLj5zdcOHuPNfTwzGMaK+60
	OwDQmvIRytVXKGuVjZLBCfrwb1+/LOPg9Tp/hPQkyW0ll46mij45cGeurbG1zG13fpA9
	7i8JxABo/UOmd3VV8/INxorUORF1oryp300xa/O+jGjg34gnz6qhFu6i4/Avup4z0mOf
	D4lHy3Iwl67IDS8z5DriS2jtvDTB7++8c3+vCZyAthJ+nKC7qSo0+NHlS4cPmzLey0JJ
	UK3A==
X-Gm-Message-State: AMCzsaU6EehdOsHp3dRkW3hGT7j53Xn76wTXgwhPf1Z7IipGKhZmM2cE
	Sezv3OyN1Oofj1nv1nwrAsBjfaHheXihCOvOAaA=
X-Google-Smtp-Source: ABhQp+R06qDGL55iTpjgOgtlWDRIlOaHBSiw/QLqf2g0FVsJV3F8j9HOq6m5jIWDHNvPGX+/xS+bJdHUhEyivTfthqc=
X-Received: by 10.55.186.196 with SMTP id k187mr6822918qkf.94.1509665429697;
	Thu, 02 Nov 2017 16:30:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Thu, 2 Nov 2017 16:30:28 -0700 (PDT)
In-Reply-To: <1509427093-808-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1509427093-808-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 2 Nov 2017 19:30:28 -0400
Message-ID: <CADkTA4N6hSjviDR1UHAyjjqpW4OfygxC=arvirhZxzrB4J_qbw@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] python-eventlet:upgrade to 0.21.0
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
X-List-Received-Date: Thu, 02 Nov 2017 23:30:31 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Oct 31, 2017 at 1:18 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-eventlet from 0.18.4 to 0.21.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-eventlet_0.18.4.bb => python-eventlet_0.21.0.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-eventlet_0.18.4.bb => python-eventlet_0.21.0.bb} (51%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-eventlet_0.18.4.bb b/meta-openstack/recipes-devtools/python/python-eventlet_0.21.0.bb
> similarity index 51%
> rename from meta-openstack/recipes-devtools/python/python-eventlet_0.18.4.bb
> rename to meta-openstack/recipes-devtools/python/python-eventlet_0.21.0.bb
> index 8c5e904..768759c 100644
> --- a/meta-openstack/recipes-devtools/python/python-eventlet_0.18.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-eventlet_0.21.0.bb
> @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
>
>  SRCNAME = "eventlet"
>
> -SRC_URI = "http://pypi.python.org/packages/source/e/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/cb/ec/eae487c106a7e38f86ac4cadafb3eec77d29996f64ca0c7015067538069b/${SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "8d1c646d8cc10a4958c92fe8a30f3676"
> -SRC_URI[sha256sum] = "74ef11d67ee5e85e009b0fced733c907620bca1ab8e6b0489d9f247405ab2685"
> +SRC_URI[md5sum] = "92aaac4c0abaddff9329f55d8f5bcd76"
> +SRC_URI[sha256sum] = "08faffab88c1b08bd53ea28bf084a572c89f7e7648bd9d71e6116ac17a51a15d"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

