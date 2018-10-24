Return-Path: <Randy.MacLeod@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E8B1E00AD8; Wed, 24 Oct 2018 07:37:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CFF96E00A0C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 24 Oct 2018 07:37:05 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9OEb0NG000368
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Oct 2018 07:37:00 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 24 Oct 2018 07:36:59 -0700
To: Ken Bassford <kbassford@apertussolutions.com>, meta-virtualization
	<meta-virtualization@yoctoproject.org>
References: <166a6155aa1.d58a0a76218926.5313920648769418063@apertussolutions.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <7efa3e16-e9e3-e825-f98d-7de794ca1afb@windriver.com>
Date: Wed, 24 Oct 2018 10:36:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <166a6155aa1.d58a0a76218926.5313920648769418063@apertussolutions.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: rocko: seabios: SRC_URI change, seabios_1.9.1.bb
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
X-List-Received-Date: Wed, 24 Oct 2018 14:37:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/24/18 8:38 AM, Ken Bassford wrote:
> 
> Hello Folks,
> 
> Found in Yocto release 'rocko'.
> Once again the SRC_URI has changed in seabios_1.9.1.bb ...
> 
>   - https://www.seabios.org/downloads/get/${PN}-${PV}.tar.gz \
>   + https://www.seabios.org/downloads/${PN}-${PV}.tar.gz \

Ken,

It seems you are new to meta-virt's workflow.

I've sent this patch on your behalf; here's how.

$ git clone git://git.yoctoproject.org/meta-virtualization meta-virt.git
$ cd meta-virt.git
$ git checkout rocko
<make the SRC_URI change>
$ git commit -a -s -m"seabios: update SRC_URI to track tarball move"
$ git send-email -1 --to meta-virtualization@yoctoproject.org \
     --subject-prefix='meta-virtualization][rocko][PATCH'

Thanks for reporting the problem and trying to fix it.
Keep climbing the learning curve.

../Randy

> 
> Sincerely,
> Ken Bassford
> Apertus Solutions
> 
> 


-- 
# Randy MacLeod
# Wind River Linux

