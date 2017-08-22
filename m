Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90600E00C91; Tue, 22 Aug 2017 08:40:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03941E00BFB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 08:40:00 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7MFdxFd020466
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 08:40:00 -0700
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 Aug 2017 08:39:59 -0700
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1503346030-16018-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <606903b5-5e18-ea3e-371c-00fe8e9a0eb1@windriver.com>
Date: Tue, 22 Aug 2017 11:39:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503346030-16018-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [PATCH] openvswitch: force PYTHON to python3
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
X-List-Received-Date: Tue, 22 Aug 2017 15:40:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/21/2017 04:07 PM, Mark Asselstine wrote:
> Openvswitch has been created to search for and use both py2 and py3,
> with a preference for py2. There is no configure option to force the
> use of py3 only, and many of the scripts only use the value of PYTHON
> and not PYTHON3 (again there is a general preference for py2). In
> order to force this issue we set PYTHON to 'python3'. This isn't ideal
> but allows for the desired outcome without us having to carry changes
> against upstream OVS.
> 
> During our py3 work with OVS this change was identified but for some
> reason was not included as part of the already merged changes.

merged.

Bruce

> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   recipes-networking/openvswitch/openvswitch.inc | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
> index 9d7f0f3..ab5a7e4 100644
> --- a/recipes-networking/openvswitch/openvswitch.inc
> +++ b/recipes-networking/openvswitch/openvswitch.inc
> @@ -34,6 +34,7 @@ SRC_URI = "\
>   	"
>   
>   EXTRA_OECONF += "\
> +	PYTHON=python3 \
>   	PYTHON3=python3 \
>   	PERL=${bindir}/perl \
>   	"
> 


