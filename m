Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF348E009F3; Tue, 18 Aug 2015 10:12:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59215E008EC
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Aug 2015 10:12:42 -0700 (PDT)
Received: by ykdt205 with SMTP id t205so165393901ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Aug 2015 10:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=U9LcwftlH/wC7OFq1UT3rtdvFUk7YSfTk9nAoq4JVxQ=;
	b=MIQzbAoBGlNrHNW85iPp33zqxLKb8LgnHufkTTbFOmW1ghuHC9ZX0Cl3JIkWS37T/6
	gl36/MLh7lr/Aqpr6cHmErSWU88nIWnuZQqZDsjMRVSPyPk3hkLZKYH9HAqkHItxMNay
	q55+Umgz724liC5MKQCFzUQIDm3+Ti37fbvWwzQMOrANM7KqRpVwAtmgOK7IV80/wWlh
	SN9UgUNITxThurlNcvlBIgWv1HkWNWQTCDrxXHjYgABDzahON99ioiC/11pjfA/k2XM/
	9ftEP3ZY8vsRBFFhcs2AdVJvb6KrhgtTTyHaApRPMSWvoxbsRg4yhY8Mrj1XfoKqcmA5
	5dVg==
MIME-Version: 1.0
X-Received: by 10.170.180.65 with SMTP id w62mr8308964ykd.60.1439917962374;
	Tue, 18 Aug 2015 10:12:42 -0700 (PDT)
Received: by 10.13.216.216 with HTTP; Tue, 18 Aug 2015 10:12:42 -0700 (PDT)
In-Reply-To: <1439890931-6587-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1439890931-6587-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Tue, 18 Aug 2015 13:12:42 -0400
Message-ID: <CADkTA4MwfmuWGVYGg4BfQEFwi6WdDjiP40KqE9GyAsffA6F+tA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH 1/2] python-vcversioner: add new recipe
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
X-List-Received-Date: Tue, 18 Aug 2015 17:12:48 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 18, 2015 at 5:42 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> Add python-vcversioner,since the newer python-jsonschema depends on it.
>

both patches merged.

Bruce

> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../python/python-vcversioner_2.14.0.0.bb                | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb b/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> new file mode 100644
> index 0000000..2fe96ab
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "An implementation of JSON Schema validation for Python"
> +HOMEPAGE = "http://github.com/Julian/jsonschema"
> +SECTION = "devel/python"
> +LICENSE = "ISC"
> +LIC_FILES_CHKSUM = "file://vcversioner.py;beginline=1;endline=13;md5=b20bc154910c13368ad5ba54560f0b0c"
> +
> +SRCNAME = "vcversioner"
> +
> +SRC_URI = "http://pypi.python.org/packages/source/v/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "7848a365ced9941053bc25d9a9f8f4b4"
> +SRC_URI[sha256sum] = "acd43686e92e6c8bbeb4f2eef54408567a7adea9692fa72d591eec5357c03b86"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> --
> 1.8.4.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

