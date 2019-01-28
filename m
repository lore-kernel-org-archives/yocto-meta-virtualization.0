Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9265E00C88; Sun, 27 Jan 2019 17:36:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2878E00C38
	for <meta-virtualization@yoctoproject.org>;
	Sun, 27 Jan 2019 17:36:09 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0S1YlUA003043
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 27 Jan 2019 17:35:59 -0800
Received: from [128.224.163.204] (128.224.163.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.435.0;
	Sun, 27 Jan 2019 17:35:19 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>, Bruce Ashfield
	<bruce.ashfield@windriver.com>
References: <1543355289-16095-1-git-send-email-mark.asselstine@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <b58b948f-ffe0-e02b-daeb-512361b2aa2a@windriver.com>
Date: Mon, 28 Jan 2019 09:35:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1543355289-16095-1-git-send-email-mark.asselstine@windriver.com>
X-Originating-IP: [128.224.163.204]
Subject: Re: [PATCH] openvswitch: uprev from 2.10.0 to 2.10.1
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
X-List-Received-Date: Mon, 28 Jan 2019 01:36:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Mark,

Which tests have you run for ovswitch. I want to update ovswitch to 2.11 
which will fix issue.

I have run ptest which executed 2764 cases, and 320 failed, 86 skipped.

Do I have to run other tests?


Thanks,

Hongzhi



On 11/28/2018 05:48 AM, Mark Asselstine wrote:
> Pickup the latest security and bug fixes for openvswitch.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   ...nvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch} | 0
>   recipes-networking/openvswitch/openvswitch_git.bb                     | 4 ++--
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename recipes-networking/openvswitch/openvswitch-git/{openvswitch-add-ptest-5563e309b80bbea9bff538e71ecfd7e5e538bab9.patch => openvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch} (100%)
>
> diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-5563e309b80bbea9bff538e71ecfd7e5e538bab9.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch
> similarity index 100%
> rename from recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-5563e309b80bbea9bff538e71ecfd7e5e538bab9.patch
> rename to recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index a930933..b8bbb3a 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -14,11 +14,11 @@ RDEPENDS_${PN}-ptest += "\
>   	"
>   
>   S = "${WORKDIR}/git"
> -PV = "2.10.0+${SRCREV}"
> +PV = "2.10.1+${SRCREV}"
>   
>   FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
>   
> -SRCREV = "5563e309b80bbea9bff538e71ecfd7e5e538bab9"
> +SRCREV = "78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e"
>   SRC_URI = "file://openvswitch-switch \
>              file://openvswitch-switch-setup \
>              file://openvswitch-testcontroller \


