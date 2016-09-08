Return-Path: <Jianchuan.Wang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 11464E011BD; Wed,  7 Sep 2016 19:46:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45F31E011AE
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Sep 2016 19:46:46 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u882kDnI025052
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Sep 2016 19:46:13 -0700 (PDT)
Received: from [128.224.163.134] (128.224.163.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 7 Sep 2016 19:46:12 -0700
To: Venkateswara Rao Mandela <venkat.mandela@ti.com>,
	<meta-virtualization@yoctoproject.org>
References: <20160908023234.15453-1-venkat.mandela@ti.com>
From: Jianchuan Wang <Jianchuan.Wang@windriver.com>
Message-ID: <2da3580c-eae7-4298-5d90-6edbbfdfe317@windriver.com>
Date: Thu, 8 Sep 2016 10:46:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160908023234.15453-1-venkat.mandela@ti.com>
Subject: Re: [PATCH 0/2] Upgrade protobuf and protobuf-c
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
X-List-Received-Date: Thu, 08 Sep 2016 02:46:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/08/2016 10:32 AM, Venkateswara Rao Mandela wrote:
> Hi Jianchun,
>
> Here are two patches I am using while trying to upgrade to criu-2.5.  These
> are reworked from the existing recipes in the tree. Hope this helps when you
> are rebasing the patches.
>
> criu-1.6 build will not work with these patches.

The criu-1.6 can work in my env after uprev protobuf and protobuf-c.

Thanks,
Jianchuan

> regards,
> Venkat
>
> Venkateswara Rao Mandela (2):
>    protobuf: update 2.5.0 -> 3.0.2
>    protobuf-c: update 0.15 -> 1.2.1
>
>   recipes-devtools/protobuf/protobuf-3.0.2.inc       |  4 ++
>   recipes-devtools/protobuf/protobuf-c-1.2.1.inc     |  4 ++
>   recipes-devtools/protobuf/protobuf-c.inc           | 11 +++
>   recipes-devtools/protobuf/protobuf-c_1.2.1.bb      | 10 +++
>   recipes-devtools/protobuf/protobuf-native_3.0.2.bb |  5 ++
>   recipes-devtools/protobuf/protobuf.inc             | 14 ++++
>   recipes-devtools/protobuf/protobuf_3.0.2.bb        | 82 ++++++++++++++++++++++
>   7 files changed, 130 insertions(+)
>   create mode 100644 recipes-devtools/protobuf/protobuf-3.0.2.inc
>   create mode 100644 recipes-devtools/protobuf/protobuf-c-1.2.1.inc
>   create mode 100644 recipes-devtools/protobuf/protobuf-c.inc
>   create mode 100644 recipes-devtools/protobuf/protobuf-c_1.2.1.bb
>   create mode 100644 recipes-devtools/protobuf/protobuf-native_3.0.2.bb
>   create mode 100644 recipes-devtools/protobuf/protobuf.inc
>   create mode 100644 recipes-devtools/protobuf/protobuf_3.0.2.bb
>


