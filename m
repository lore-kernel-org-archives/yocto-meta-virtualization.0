Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8FED8E00833; Fri, 15 Jan 2016 06:41:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77FF5E00833
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Jan 2016 06:41:15 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0FEfFhc026329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Jan 2016 06:41:15 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 15 Jan 2016 06:41:14 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1452805288-19550-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <56990509.6000308@windriver.com>
Date: Fri, 15 Jan 2016 09:41:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1452805288-19550-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [m-c-s][PATCH 1/2] python-wrapt: add recipe
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
X-List-Received-Date: Fri, 15 Jan 2016 14:41:19 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

merged to master.

Bruce

On 16-01-14 04:01 PM, Mark Asselstine wrote:
> From: Josep Puigdemont <josep.puigdemont@enea.com>
>
> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>
> ** cherry-picked from fido-kilo **
>
>   meta-openstack/recipes-devtools/python/python-wrapt_1.10.5.bb | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>   create mode 100644 meta-openstack/recipes-devtools/python/python-wrapt_1.10.5.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-wrapt_1.10.5.bb b/meta-openstack/recipes-devtools/python/python-wrapt_1.10.5.bb
> new file mode 100644
> index 0000000..5a8d0e7
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-wrapt_1.10.5.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION = "A Python module for decorators, wrappers and monkey patching."
> +HOMEPAGE = "https://pypi.python.org/pypi/wrapt/"
> +SECTION = "devel/python"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=848d45ec255e411c0ff82b034a49d8a0"
> +
> +SRC_URI[md5sum] = "79732bbc096235704e7523d3bacd202c"
> +SRC_URI[sha256sum] = "99cbb4e3a3ea964df0cb1437261fc1198616ec872e7b501622f3f7f92fcd0833"
> +
> +inherit pypi
> +
>


