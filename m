Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04BEFE00509; Wed, 25 Jun 2014 05:35:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE408E003C1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Jun 2014 05:35:10 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5PCZ7g9001255
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Jun 2014 05:35:07 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 25 Jun 2014 05:35:06 -0700
Message-ID: <53AAC1E0.8020305@windriver.com>
Date: Wed, 25 Jun 2014 08:34:40 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Gaurang Shastri <gmshastri@gmail.com>,
	<meta-virtualization@yoctoproject.org>
References: <CAE_REAv=XBPGSLe_zPUFqpU5cnnW_TPqfo75SjSLY-HSkBcePQ@mail.gmail.com>
	<CAE_REAvX1Mx0PDxW0SAiMMXciCLLEGM5WsHCxL70NQ-cZ3rJ=w@mail.gmail.com>
In-Reply-To: <CAE_REAvX1Mx0PDxW0SAiMMXciCLLEGM5WsHCxL70NQ-cZ3rJ=w@mail.gmail.com>
Subject: Re: [meta-mvcloud-services] python-lxml points to wrong LIC_FILES_CHKSUM
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
X-List-Received-Date: Wed, 25 Jun 2014 12:35:13 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-06-25 04:21 AM, Gaurang Shastri wrote:
> Adding meta-virtualization group....

Looks like an errant push and a sstate build making it work for me!

I'll fix it shortly.

Thanks for the report!

Bruce

>
> ---------- Forwarded message ----------
> From: *Gaurang Shastri* <gmshastri@gmail.com <mailto:gmshastri@gmail.com>>
> Date: Wed, Jun 25, 2014 at 1:49 PM
> Subject: [meta-mvcloud-services] python-lxml points to wrong
> LIC_FILES_CHKSUM
> To: bruce.ashfield@windriver.com <mailto:bruce.ashfield@windriver.com>
>
>
> Dear Bruce,
>
> While building meta-cloud-services, I got error in LIC_FILES_CHKSUM of
> python-lxml package.
>
> I think we should correct from
>
> *LIC_FILES_CHKSUM = "file://LICENSE.txt;md5="%LIC_MD5SUM%"*
>
> to
>
> *LIC_FILES_CHKSUM =
> "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b"*
> *
> *
> The above will fix the build issue of python-lxml.
>
> Regards,
> Gaurang Shastri
>


