Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C175E00B18; Thu, 29 Jun 2017 12:01:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43733E0084A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jun 2017 12:01:29 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5TJ1Sfx032273
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jun 2017 12:01:28 -0700
Received: from server.local (128.224.23.50) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 29 Jun 2017 12:01:28 -0700
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1498758999-7928-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <e900613f-ce9a-6c79-533d-047b8c12ec0b@windriver.com>
Date: Thu, 29 Jun 2017 15:01:27 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1498758999-7928-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] python: satisfy setup.py 'setup_requires' for vcversioner
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
X-List-Received-Date: Thu, 29 Jun 2017 19:01:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

merged.

Bruce

On 2017-06-29 1:56 PM, Mark Asselstine wrote:
> python-jsonschema has a 'setup_requires' for python vcversioner so we
> must have a -native version of python-vcversioner and DEPEND on it in
> order to avoid setup.py downloading the requires from PyPI.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb | 5 +++++
>   .../recipes-devtools/python/python-vcversioner_2.14.0.0.bb        | 8 ++++++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb b/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
> index a3a7ec0..fef8d5f 100644
> --- a/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
> @@ -17,3 +17,8 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
>   inherit setuptools
>   
>   DEPENDS += "python-vcversioner"
> +
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-vcversioner-native \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb b/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> index 2fe96ab..bcff6f3 100644
> --- a/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> @@ -14,3 +14,11 @@ SRC_URI[sha256sum] = "acd43686e92e6c8bbeb4f2eef54408567a7adea9692fa72d591eec5357
>   S = "${WORKDIR}/${SRCNAME}-${PV}"
>   
>   inherit setuptools
> +
> +
> +DEPENDS_class-native += " \
> +        python \
> +        python-setuptools \
> +        "
> +
> +BBCLASSEXTEND = "native"
> 


