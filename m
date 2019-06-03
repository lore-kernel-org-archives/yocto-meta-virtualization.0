Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45241E00C7D; Sun,  2 Jun 2019 18:45:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 240D8E00A00
	for <meta-virtualization@yoctoproject.org>;
	Sun,  2 Jun 2019 18:45:41 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x531jd0Q022918
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Jun 2019 18:45:39 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 2 Jun 2019 18:45:38 -0700
To: <meta-virtualization@yoctoproject.org>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
References: <1559195272-27896-1-git-send-email-hongzhi.song@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <73c1cc52-4704-ac9d-d96f-3d4eaee93b00@windriver.com>
Date: Mon, 3 Jun 2019 09:45:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559195272-27896-1-git-send-email-hongzhi.song@windriver.com>
X-Originating-IP: [128.224.162.188]
Subject: Re: [meta-cloud-services][PATCH 0/4] update bbappend to match bb version
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
X-List-Received-Date: Mon, 03 Jun 2019 01:45:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ping

--Hongzhi


On 5/30/19 1:47 PM, Hongzhi.Song wrote:
>
> Hongzhi.Song (4):
>    iptables: update bbappend to match to oe-core version
>    libvirt: update bbappend to match bb version
>    linux: update bbappend to match oe-core version
>    iproute2: update bbappend to match bb version
>
>   .../recipes-extended/iptables/iptables_1.6.%.bbappend       |  3 ---
>   .../recipes-extended/iptables/iptables_1.8.%.bbappend       |  3 +++
>   .../recipes-extended/libvirt/libvirt_4.%.bbappend           | 13 -------------
>   .../recipes-extended/libvirt/libvirt_5.%.bbappend           | 13 +++++++++++++
>   .../recipes-kernel/linux/linux-yocto_4.18.bbappend          |  9 ---------
>   .../recipes-kernel/linux/linux-yocto_5.0.bbappend           |  9 +++++++++
>   .../recipes-support/iproute2/iproute2_4.%.bbappend          |  4 ----
>   .../recipes-support/iproute2/iproute2_5.%.bbappend          |  4 ++++
>   8 files changed, 29 insertions(+), 29 deletions(-)
>   delete mode 100644 meta-openstack/recipes-extended/iptables/iptables_1.6.%.bbappend
>   create mode 100644 meta-openstack/recipes-extended/iptables/iptables_1.8.%.bbappend
>   delete mode 100644 meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
>   create mode 100644 meta-openstack/recipes-extended/libvirt/libvirt_5.%.bbappend
>   delete mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_4.18.bbappend
>   create mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_5.0.bbappend
>   delete mode 100644 meta-openstack/recipes-support/iproute2/iproute2_4.%.bbappend
>   create mode 100644 meta-openstack/recipes-support/iproute2/iproute2_5.%.bbappend
>

