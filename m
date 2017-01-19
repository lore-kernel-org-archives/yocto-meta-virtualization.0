Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 55B46E00A16; Thu, 19 Jan 2017 06:48:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.182 listed in dnsbl.sorbs.net]
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 587EAE00A03
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Jan 2017 06:48:16 -0800 (PST)
Received: by mail-yw0-f182.google.com with SMTP id l75so35625980ywb.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Jan 2017 06:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=UaLe49T7ZJrg8aaShBLqpzqLOHW1QjuewEhU5/7S09Q=;
	b=iwyhUr0WNMm9SszgaTORkPryq5mGMErWusqZDA5lI7ZvCvk6jVy4iAGl+1eO4E2Dno
	wVLqSEVEjjHwNwAWTuPVQFhiYyY/lsU5VHVjwEIwUK4UcWXZFz6o9kBZmclHuD5oEiTG
	zsv4ckp1LEwWkDd1fnhEwkJ6osephVecOyTwzQjOCWcmt0qmxWslNU/2FymkslTsHFqD
	C6HaU4TPeSs9OIHOYrdVid4TYNqCWsDnw5V7DtmzEz2iOoqu5cyIgHSWb6TQf2LvnrNh
	Lvid+oy5QB10ivsjh5i+8j7TopElUPMu55T+XCcTXvRNWIssmXzRdZCbSBe4bxPaYiQ5
	zqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=UaLe49T7ZJrg8aaShBLqpzqLOHW1QjuewEhU5/7S09Q=;
	b=DotaLVBcmcChC/mxSOotblRg3vSGCq6pf77KT8m0JCEaA8wQkWieTve8VmHnav8HvC
	C/FZqfcxgjz4GKIVB9YgIPt/ym5iyWjNlZRcVUZ81/g2oPOLweSvt3F79NFrm2BTRGvo
	gNJoNHzojjcU8TRYFl9V9Llwe/BON9nRQ8qoXfJWVuzJLAjYRiNwiP57pKGIlbil/4PT
	EgAeZaNKYr8aa9c7Zc7fDqva9mWQVOnimaIlUQOo2YW9+qQbUeIpnUb7N/3EyD/uUQMg
	uHv2MBaUa0RWTcUxC9HeKGHMySAKGkvproKzly5/SkhTyvaQXTSmQDrLpdio6OOr3XaT
	wBJQ==
X-Gm-Message-State: AIkVDXKC2DcB4G2fC7Qv1wkOokiPiif63ISzmfDUkClbHT3M3cCaOu97oG2HgRPzABk3ozwEPOBcl/UXZ3OE0g==
X-Received: by 10.129.96.137 with SMTP id u131mr7841073ywb.302.1484837295682; 
	Thu, 19 Jan 2017 06:48:15 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.174.99 with HTTP; Thu, 19 Jan 2017 06:48:15 -0800 (PST)
In-Reply-To: <1484728608-28908-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1484728608-28908-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Thu, 19 Jan 2017 09:48:15 -0500
X-Google-Sender-Auth: AfkVW1vz3eW1uLazMoPLPbSJ9sE
Message-ID: <CAPuovE+enDfiTsAi2WFDAZ_5BOsz1P_wBDvt1ncqhPYKhv8W4Q@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-sqlalchemy: 1.0.9 -> 1.1.5
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
X-List-Received-Date: Thu, 19 Jan 2017 14:48:20 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 18, 2017 at 3:36 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> 1) Upgrade python-sqlalchemy from 1.0.9 to 1.1.5.
> 2) License checksum changed,since the copyright years were updated.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

As I mentioned yesterday we still require the 1.0.x series to support
packages in meta-cloud-services so there might be a case to have both
available and then use PREF VERSION to select the correct series. I
will have a closer look at this today and work with Bruce to get a
workable solution in place.

Mark


> ---
>  recipes-devtools/python/python-sqlalchemy_1.0.9.bb | 16 ----------------
>  recipes-devtools/python/python-sqlalchemy_1.1.5.bb | 16 ++++++++++++++++
>  2 files changed, 16 insertions(+), 16 deletions(-)
>  delete mode 100644 recipes-devtools/python/python-sqlalchemy_1.0.9.bb
>  create mode 100644 recipes-devtools/python/python-sqlalchemy_1.1.5.bb
>
> diff --git a/recipes-devtools/python/python-sqlalchemy_1.0.9.bb b/recipes-devtools/python/python-sqlalchemy_1.0.9.bb
> deleted file mode 100644
> index 01c94a5..0000000
> --- a/recipes-devtools/python/python-sqlalchemy_1.0.9.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
> -application developers the full power and flexibility of SQL"
> -HOMEPAGE = "http://www.sqlalchemy.org/"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=cf755cb27ad4331d45dbb4db5172fd33"
> -RDEPENDS_${PN} += "python-numbers"
> -
> -SRCNAME = "SQLAlchemy"
> -SRC_URI = "https://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "0e2d7442e70d02c9f6346a5bf0ec2265"
> -SRC_URI[sha256sum] = "c3d37501e36ec5d74c2d7b4a3764719db86a9cdab4a24431bf58b386743ab10e"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> diff --git a/recipes-devtools/python/python-sqlalchemy_1.1.5.bb b/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
> new file mode 100644
> index 0000000..63caeb4
> --- /dev/null
> +++ b/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
> +application developers the full power and flexibility of SQL"
> +HOMEPAGE = "http://www.sqlalchemy.org/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
> +RDEPENDS_${PN} += "python-numbers"
> +
> +SRCNAME = "SQLAlchemy"
> +SRC_URI = "https://pypi.python.org/packages/da/04/8048a5075d6e29235bbd6f1ea092a38dbe2630c670e73d4aa923a4e5521c/${SRCNAME}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "50685d97dca4b91945ae6309d03ab8c9"
> +SRC_URI[sha256sum] = "68fb40049690e567ebda7b270176f5abf0d53d9fbd515fec4e43326f601119b6"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
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

