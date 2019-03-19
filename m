Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 92BB3E00D07; Mon, 18 Mar 2019 23:21:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D3D1E00754
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Mar 2019 23:21:09 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2J6KCss008854
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Mar 2019 23:20:43 -0700
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 18 Mar 2019 23:20:26 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <3b4cc4ec-fd4f-83a6-b019-5300f302fadc@windriver.com>
	<CADkTA4Ows5JiVxF_dWwoNNj=ZBLq9Rij6Dm81uE63TtrDpKW6g@mail.gmail.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <f3857bc5-63bc-2ac4-2cd1-f943d82f0ce2@windriver.com>
Date: Tue, 19 Mar 2019 14:20:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Ows5JiVxF_dWwoNNj=ZBLq9Rij6Dm81uE63TtrDpKW6g@mail.gmail.com>
X-Originating-IP: [128.224.162.188]
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Ask for if can I remove notary recipe under recipes-devtools/go/
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
X-List-Received-Date: Tue, 19 Mar 2019 06:21:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/19/19 11:38 AM, Bruce Ashfield wrote:
> On Mon, Mar 18, 2019 at 11:33 PM Hongzhi, Song
> <hongzhi.song@windriver.com> wrote:
>> Hi all,
>>
>> Based on updated strategy around GO (source) dependencies that dependencies
>>
>> have been populated to package-self vendor directory. So some unused
>> recipe can
>>
>> be dropped.
>>
>>
>> I think notary recipe is one of unused recipe. I find it is only
>> depended by docker now.
>>
>> But docker has include notary under itself vendor directory. So I think
>> notary recipe can
>>
>> be dropped.
>>
>>
>> Maybe I miss other dependency relationships. So I want make sure that if
>> notary can be
> There's a lot of different ways to build docker due to the moby-docker
> and docker-ce, combinations. So for now, we'd be safer to keep it
> around a bit longer and have another look at it in the fall.

OK. Since the notary is remained, I will upgrade it.

Hongzhi


>
> Bruce
>
>> dropped.
>>
>>
>> Thanks,
>>
>> Hongzhi
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>

