Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C275E00DD9; Mon,  9 Sep 2019 10:36:42 -0700 (PDT)
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
	*      [209.85.167.41 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD193E00DE6
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 10:36:39 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id t8so11154485lfc.13
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Sep 2019 10:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3InobB3O4sLJ/FUxBKDk9LBdbAPNMxj1ftF78OZXfrA=;
	b=lwAvrAEvet5EEpmFWAvZ9d5+S22zowba7duEXe2nvL2rgFB8C+B99nT8W4qbravIEo
	iIzEeFnjFcwTu/0NSfcBRhJz47Pgpndi04fmPF1+Uh1dWdgosaxULoe1DQVrn8J5KAj4
	/vITBpB8CEH7Oil3hMRn36wq0UdDDn25gVIT0Me8Us2T9AxhuB4jfJ9G/A4H1w7KX82V
	rgehtzZyIXn3ByeNq19U8ZZ70j4aI3GBzyiq0vGMz1lCNIVzZ671h5B+6fiiaX5ZUK7K
	5dy04vY6dHN7Ayj1aKxba5qqZH6DutykeiFQ9S6QAoDdmCzZZRkgG3U31DukWDjUKWra
	S4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3InobB3O4sLJ/FUxBKDk9LBdbAPNMxj1ftF78OZXfrA=;
	b=XvtQSD9vwPmR5Tyw1L/08J6EPFgj2wy+84owe6SSCHMBf/ctuxuKs4mNabPmynyzoV
	o4HOfjP9kFQ9ePwNQn5tw+/dJ0/mRdFSWgJ7LAno2ZFIFuV5fszJGJt5HcrJp13d5mZI
	IFjB9rIHWKUYGT2SLdcC2fpLPuycQj4RB3J3Z073yJW4rMx6HWaELsLkgDYlhMuPbU4T
	vR7tlsgHe3d7xpVzXsbwjJB9iTu0R7tdz99DXs36jZCjGhAIqkikNTccqlZAmKEQ8Qd0
	1eoBQsiTOqZS5s2Hs4UMlOcwwk0b/1MlM8NY8NoarTv76EadkttMZT6LoLvsoC5O1J+n
	ag9w==
X-Gm-Message-State: APjAAAWl9R9l+DWIZLr5bKSV9il5o/5fvqC5k0EZgTTzkaUVtvx79uB2
	3yHzU+N/MbB2zNxzXnTq7LzuzDN9hmawiNfK1z0=
X-Google-Smtp-Source: APXvYqw5EiSmzdt8yxi9RfLiHk7vRcRUI8Lun+FwQN1EeBQ1OaL/s/g0Z41Cq6IjGw0yvVJj9jxOoi2jVwOuA7fMQGg=
X-Received: by 2002:a19:711e:: with SMTP id m30mr17707997lfc.63.1568050598528; 
	Mon, 09 Sep 2019 10:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190909074316.14023-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190909074316.14023-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Sep 2019 13:36:27 -0400
Message-ID: <CADkTA4M=u-fXEXo4fZLwsRXzCPhqYzrX3xHv-gG28dV+x6g-8Q@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-statsd: Add python3 version
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
X-List-Received-Date: Mon, 09 Sep 2019 17:36:42 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Sep 9, 2019 at 3:44 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-statsd.inc  | 13 +++++++++++++
>  .../recipes-devtools/python/python-statsd_3.3.0.bb        | 15 +--------------
>  .../recipes-devtools/python/python3-statsd_3.3.0.bb       |  2 ++
>  3 files changed, 16 insertions(+), 14 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-statsd.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-statsd_3.3.0.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-statsd.inc b/meta-openstack/recipes-devtools/python/python-statsd.inc
> new file mode 100644
> index 0000000..33257b9
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-statsd.inc
> @@ -0,0 +1,13 @@
> +DESCRIPTION = "A simple statsd client."
> +HOMEPAGE = "https://github.com/jsocol/pystatsd"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4d8aa8ac1dc54b8aee4054bd5e5c61bd"
> +
> +inherit pypi
> +
> +SRC_URI[md5sum] = "b397ccf880f37cf099e775907ebf7a46"
> +SRC_URI[sha256sum] = "e3e6db4c246f7c59003e51c9720a51a7f39a396541cb9b147ff4b14d15b5dd1f"
> +
> +RDEPENDS_${PN} += " \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-statsd_3.3.0.bb b/meta-openstack/recipes-devtools/python/python-statsd_3.3.0.bb
> index 7400129..51b179b 100644
> --- a/meta-openstack/recipes-devtools/python/python-statsd_3.3.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-statsd_3.3.0.bb
> @@ -1,15 +1,2 @@
> -DESCRIPTION = "A simple statsd client."
> -HOMEPAGE = "https://github.com/jsocol/pystatsd"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=4d8aa8ac1dc54b8aee4054bd5e5c61bd"
> -
> -inherit pypi
> -
> -SRC_URI[md5sum] = "b397ccf880f37cf099e775907ebf7a46"
> -SRC_URI[sha256sum] = "e3e6db4c246f7c59003e51c9720a51a7f39a396541cb9b147ff4b14d15b5dd1f"
> -
>  inherit setuptools
> -
> -RDEPENDS_${PN} += " \
> -        "
> +require python-statsd.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-statsd_3.3.0.bb b/meta-openstack/recipes-devtools/python/python3-statsd_3.3.0.bb
> new file mode 100644
> index 0000000..51b179b
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-statsd_3.3.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-statsd.inc
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
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

