Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 110FFE00777; Tue, 28 Aug 2018 05:22:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67F75E00519
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Aug 2018 05:22:08 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id 203-v6so1206532ljj.13
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Aug 2018 05:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8mVc9dhmHrt2eIyi5p8P6f9GXH1mrwBFJ55SwOfiFEk=;
	b=c1S8w+2q+oF29WzWks1OYSzX15MUMAcZxmkCGkNBRPbYA7X26pv8owihoAMQCagl+q
	w2L1PB+wuBa0cGcHM8XOmsHhEyqoAhzMQDO7oGdcCDWd/MFpgs7Jj4DijW0dhjgj7Gp6
	fcC5Nn2bVj2MgD6qTPQCxPNd8NNC4sqUiq/Ur3pHEOF69ErWPQhtsxZMmCjDRbI3KxCQ
	ORf2QIK3ZxSfUrvyyGieljbW4rSHeX56Og8cZbgW9Tlbpf6aljirGMz365K8BK0mT8Us
	Czdh86/uvG+GaeLt6VRN1javZFruKT3dFubQIIjCpUVbL+I0rk0k7QzPDwSCDzhSM1cG
	TIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8mVc9dhmHrt2eIyi5p8P6f9GXH1mrwBFJ55SwOfiFEk=;
	b=CqnJ6Sa52ZqwkaHUbtT8GlM0OACMoNZuQrSCJYZTttqgnPXZymTwf86uNX8FHQDMPd
	dx8JB5g+7FyrTWv7u+Ff9DoKcpqQB882cGTut4kxDZsT+aX7e9LqBepgaceEqGybsnBc
	yLOnHAcUo6Io6JQAx/7BmxvpeFIH0f75AWu+gpa2SK6HyQ96A90JBGtwR1q/See1txpo
	BUcX7HnndqLOcb11O0uUlyVs5XGd5r75tgQyNicTGytFNJw5M5lOJ8vibyo4rR8cSjX0
	VLfBZp5cWHBa635D8gwvHUs+qrbDD/o5Sg1Ixt6kCEPLWiKNumYKvCZVQjfgGrN6Othc
	bCFA==
X-Gm-Message-State: APzg51AlMd6lqKqy1xHZrSco+aoUz7/wYPfJyvku9PMeLMQquf8beoee
	CB9zowDz0YyyBWSl7b1E/+EqsPIvBgDKH39D+Z8=
X-Google-Smtp-Source: ANB0VdZiFfdTREh3U6Xvx+3qZE/bpHQlrYz4x0ftNxWfp0rvG+Gn6Jpc1fXqUQKnEMasDlyMst74h0kcZ8AGSnfvpg4=
X-Received: by 2002:a2e:5c07:: with SMTP id
	q7-v6mr1080723ljb.119.1535458927262; 
	Tue, 28 Aug 2018 05:22:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Tue, 28 Aug 2018 05:22:06
	-0700 (PDT)
In-Reply-To: <20180820160023.5432-1-adrian.ratiu@ni.com>
References: <20180820160023.5432-1-adrian.ratiu@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Aug 2018 08:22:06 -0400
Message-ID: <CADkTA4MrpYLrpbrwhNT7_4G=T-R-ojJFkC7GEHjNTxkQik93jQ@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Sergey Kizunov <sergey.kizunov@ni.com>,
	meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH 1/2] python-pytest-salt: add recipe
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
X-List-Received-Date: Tue, 28 Aug 2018 12:22:09 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 20, 2018 at 12:00 PM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> From: Sergey Kizunov <sergey.kizunov@ni.com>
>
> Signed-off-by: Sergey Kizunov <sergey.kizunov@ni.com>
> ---
>  .../python/python-pytest-salt_2017.7.0.bb     | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.bb b/meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.bb
> new file mode 100644
> index 0000000..e2cf1cd
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "This pytest plugin will allow the Salt Daemons to be used in tests."
> +HOMEPAGE = "https://github.com/saltstack/pytest-salt"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
> +
> +SRCNAME = "pytest-salt"
> +SRC_URI = "git://github.com/saltstack/${SRCNAME}.git;branch=master"
> +
> +SRC_URI[md5sum] = "c598d7db87ea52cdeb067d7596b3b0b1"
> +SRC_URI[sha256sum] = "7052459cda9fbdbbfff9a25b24243b0b96cf56835a2c41135d754cc5b65e2494"
> +
> +SRCREV = "feb5031f80cf84b113ebe69543cdd44b6a373d21"
> +S = "${WORKDIR}/git"
> +
> +inherit setuptools
> +
> +RDEPENDS_${PN} = " \
> +    python-pytest \
> +    python-pytest-tempdir \
> +    python-pytest-helpers-namespace \
> +    python-psutil \
> +    "
> --
> 2.18.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

