Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5CF50E00D5F; Sun, 25 Aug 2019 19:21:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B883DE008E3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Aug 2019 19:21:54 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id u15so13607097ljl.3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Aug 2019 19:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dGjEGzIIibDa3u0zPv1LJIPNcU/zYlEqxpUBmvZ0+6M=;
	b=dUrCmxet+Yij5j+2A5JODkWEfMtQljIed0pGPa5LDCWAyIjuIufhSigVOqSRtVI/qi
	c8iiabhs6AsnyG2uSe4zDo7IKF1PdGDT01OT9b8zzOZYQYmJ7vZToBnQtbqKHDhJws/C
	Y4DQtj1VYkSc7huKk1YGKj3CN5f8K92S6LSC3UGfzQeyWHyE0IsHIy1kxAhPN49j6rgi
	7SQj1OFimhac2+F+2SAHuTCp6ZK6nHkMme5y1CMh7d4e6iCtSTGF0phee0NU8nRpII0k
	CqlDW2ioulNLrcyOFv2kLuMOLiU+ndc63OOh9OarY/Tb91PuMsbuirUfJCAbqXovB1it
	4hYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dGjEGzIIibDa3u0zPv1LJIPNcU/zYlEqxpUBmvZ0+6M=;
	b=ZpFLt0NJhtAIOxW3RPvnfIq/8CCsEv/lJUpcJZMlWa36wcfcfFwht7Ej4fuRedh3wP
	jFCj9Ja1zWbQsHu55XOFOguNckpPftWrh+0oVcUmElVAGwhp76Q7LPZWZcoY/8JFTyeE
	Ky7Z3aK6+ozU7th1ncYjWxClh+iCaWqS26rh7Z3IeyOMrsdrhDEgX2KqsdJkPoJlbR4z
	kTxhqaYvKkAK8mMi+QBKvvLvAFg3cFbInAws22kViETf2hIm3OhLUjnmKqRTg+f5LtlB
	nI64vp+ZXJHduZiGXMn3UYVvRfNsDZuvGzaXMLDznevuc2oqFzVv4y8+r8p5Qx7+wclS
	B7wA==
X-Gm-Message-State: APjAAAXLYEgWivs/QkMpP+SlMEK+H4dDdgyCqaDWZkvVVQaB7m4EiVtb
	gKzD11ZbJ1UR47iNmfD+ar1Q9XZforodxyrwvwM=
X-Google-Smtp-Source: APXvYqy+QmL4SltD7hUTDV0ZI7/WG43DQujWTBULpQJQcbEtfjV6uTdPXrvcUSEW/GQulxt0o00tBfR1OQ3Hj+9BKX0=
X-Received: by 2002:a2e:b048:: with SMTP id d8mr9366421ljl.118.1566786113634; 
	Sun, 25 Aug 2019 19:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190822011501.116509-1-yuanc.fnst@cn.fujitsu.com>
In-Reply-To: <20190822011501.116509-1-yuanc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 25 Aug 2019 22:21:42 -0400
Message-ID: <CADkTA4OiuUoAKk2aK9ADZrpFtEvtWOCLjzakitvUn+DxxHDYZQ@mail.gmail.com>
To: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-keystoneauth1: upgrade 3.16.0 -> 3.17.0
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
X-List-Received-Date: Mon, 26 Aug 2019 02:21:57 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Aug 21, 2019 at 9:15 PM Yuan Chao <yuanc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  ...keystoneauth1_3.16.0.bb => python-keystoneauth1_3.17.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-keystoneauth1_3.16.0.bb => python-keystoneauth1_3.17.0.bb} (79%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.16.0.bb b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb
> similarity index 79%
> rename from meta-openstack/recipes-devtools/python/python-keystoneauth1_3.16.0.bb
> rename to meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb
> index fd1d848..18115b2 100644
> --- a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.16.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
>
> -SRC_URI[md5sum] = "4d2b56ac0b3d19eacb7f3a3198cfcc54"
> -SRC_URI[sha256sum] = "0465ed3e69ec0a148a5785f59f6fd3cece7808090cbcb90a2d2cb27ab360d9d7"
> +SRC_URI[md5sum] = "599340c2b3ccbcf9996870478abb5407"
> +SRC_URI[sha256sum] = "59a4488ceae0c1210cba468945013b875b2ce09d99c54c9fcc9c926aea55dfd7"
>
>  inherit setuptools pypi
>
> --
> 2.17.1
>
>
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

