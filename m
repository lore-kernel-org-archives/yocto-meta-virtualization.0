Return-Path: <jakob.hasse@qiio.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9D599E0166D; Wed,  6 Jun 2018 10:06:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.2.89 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0089.outbound.protection.outlook.com [104.47.2.89])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2C47E010C5;
	Wed,  6 Jun 2018 10:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=smarthometechnologych.onmicrosoft.com; s=selector1-qiio-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SQzSYkhMecAqn2x59H9r5w7L8i9PaZ9gjpoGVA/7WZQ=;
	b=T77/wMHqGxSxjk1Mnlo3TtiXXftF2FxLvSiPVSuv+xGhqrVDUCt/rCtIoXTNcOBhNB0FVMcKga0ibrC6WTJ27MyHGr+pMgpuPwJbGpf4L/SQXxOGfjfBdv0PHlyTLH8LjuL6QZoZxygIHmzItykmw74zcRFF39YYX+ge24AraV4=
Received: from [IPv6:2a02:168:6893:1:89ab:e652:a54b:537d]
	(2a02:168:6893:1:89ab:e652:a54b:537d) by
	HE1P192MB0059.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:101::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.15; Wed, 6 Jun 2018 14:33:14 +0000
From: Jakob Hasse <jakob.hasse@qiio.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Yocto List <yocto@yoctoproject.org>
References: <783ff7cd-c1d8-1802-4b67-3aff339aae31@smart-home-technology.ch>
	<6391ddea-802d-7f4d-26b3-44a79556c8a0@windriver.com>
	<761e6979-b696-04f6-6e62-e325bc979c38@smart-home-technology.ch>
	<80617b66-6714-03f6-f6e7-45afc4def6d5@windriver.com>
	<a8aa1583-28fe-065b-f4d9-c8cfd90a5ead@smart-home-technology.ch>
	<4b1fb073-e2f1-0d51-a5d8-a431e581d59d@qiio.com>
Message-ID: <63766f21-5e67-885c-dbed-77cfbf0af990@qiio.com>
Date: Wed, 6 Jun 2018 16:33:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <4b1fb073-e2f1-0d51-a5d8-a431e581d59d@qiio.com>
X-Originating-IP: [2a02:168:6893:1:89ab:e652:a54b:537d]
X-ClientProxiedBy: VI1PR0102CA0070.eurprd01.prod.exchangelabs.com
	(2603:10a6:803::47) To HE1P192MB0059.EURP192.PROD.OUTLOOK.COM
	(2603:10a6:3:101::21)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(2017052603328)(7153060)(7193020);
	SRVR:HE1P192MB0059; 
X-Microsoft-Exchange-Diagnostics: 1; HE1P192MB0059;
	3:WQe6w2RaSoalEdNTzhL9QcwsMDmHa2+Izg5sSuhTfmTuldwTKNZkHcbiePwmuLGtflPwDGyD47bHapk6rQiJ6apoF901zDp6LhTosxdqu7XyRr0OfKId5g8XB+hCqN6JS4KRC+WTttzX2Czep1NWG2Cj4t23M55NCbIF18RnJTIj5HUtrbds3fhAj7GP0fBhUMmFjt05HHBk1E/RyZXWi63wOTlbb3hZ9huKQwC2h405vsi2fbqvlBo6jUdPP2yV;
	25:+e7dUNu9T4LAq+Tz/YyXL+9b1snrx7BEZwaUVnGV5HHqz7kACOW0aGJzGdC6eHxiywnFreaCMy8mtzKDMbem3wxbJcjg5KohnJNxzNy6ogyBueuZQkieALTYpeHJISG8tGwDn3kaELAEqvP7RH7YiR9Yea+eKb85g6yl8zT8tcx+19U9S6MNUY/zEZ6q2fnPC93Eg6iGueEM/3mauAUKp/pUEkq2oV1+u2+bE1W0utsjkupvTVvD0oLmPeOqWFWiJ+lupXlBKSKp4jAsSavMLGgUM9Y6oF4wJbn3Csv8mNvZ4g0aOM1yzJA1DbHjeIrlTWawGV7UKrCrmaAU0t+Ivg==;
	31:uSz0+F33TD5iN/tduWiuFwq95CScabTlQGzPBIUh3OIaJd8b08JN+3TscmRy62jN8yLhJmkcU3OqbelDIuvSgvH+E4s9V00HKN4NrRuDbo2P1tBY4RxAWApAEypt3d9r23RQqG7WWjG7apST7stlZDgZJPPJIPPOIHeO/XE9pKlZiKn9OtVtez3cLf5fjyzcKvtqN1Y/XN74X2mC9RxQQSKACvjnTrBe82Jrypr8AIs=
X-MS-TrafficTypeDiagnostic: HE1P192MB0059:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=jakob.hasse@qiio.com; 
X-Microsoft-Antispam-PRVS: <HE1P192MB005967C47CD2249E3C4CAAB184650@HE1P192MB0059.EURP192.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(788757137089);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(2016111802025)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(6043046)(6072148)(201708071742011)(7699016);
	SRVR:HE1P192MB0059; BCL:0; PCL:0; RULEID:; SRVR:HE1P192MB0059; 
X-Microsoft-Exchange-Diagnostics: 1; HE1P192MB0059;
	4:OhpPj1zafhU7rc4+15fih58DiXU6G+M2YG3qfOIgfuiadBba7ZE6HP0U2Lib19EKwrcjaSsfX0qV8HMdqk15XtX7TuTBKCGXtaRbkjhP98oTLBNNvwLk8DcVGMzsDBBLi/inm0eQXXeeYVJsj/lc/8zLC8KhPLzecNYUbmoPYMlM7EZGDMI4HjAp2zjNcxBhlFlboP1JEDyyu+Ag6y36jSy7/tBM1HzzFDM/7ccI/eJv3/CkVG77Df4CtCys8Jt5T6VGcB10MYp9/H4k/gK2zGFBN7iGS+uRAN6ZUDHbNSK867vAAQ33PH+k8KhiLrzYoQlh3Wp70DT9sWA6aulYhg==
X-Forefront-PRVS: 06952FC175
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(366004)(376002)(39830400003)(346002)(39380400002)(396003)(189003)(199004)(65806001)(8936002)(446003)(44832011)(106356001)(486006)(2870700001)(8676002)(81156014)(65826007)(2616005)(68736007)(81166006)(6306002)(305945005)(478600001)(476003)(5660300001)(31686004)(966005)(7736002)(105586002)(23676004)(46003)(6666003)(52396003)(11346002)(345774005)(1857600001)(76176011)(6486002)(64126003)(2486003)(52146003)(25786009)(50466002)(52116002)(58126008)(54906003)(36756003)(6116002)(107886003)(4326008)(16526019)(97736004)(110136005)(1706002)(386003)(53546011)(59450400001)(86362001)(575784001)(67846002)(31696002)(53936002)(2906002)(65956001)(47776003)(93886005)(316002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1P192MB0059;
	H:[IPv6:2a02:168:6893:1:89ab:e652:a54b:537d]; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: qiio.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtIRTFQMTkyTUIwMDU5OzIzOkh2WGR6SjBZV0tEZmdjbXFvbjU4eFJtd2xR?=
	=?utf-8?B?SENyTGtIMmdyaVIyN05FU1BMN3Z3aG1sM3IxcVBkYmNVWDlKcm1YZitYaGRE?=
	=?utf-8?B?UC9uUnNyQkNwRlF5WWV1eGVtUnhXdStSaEdoc0V5QzR0NStrdnY1cnhkTlRE?=
	=?utf-8?B?WFd5bk1rWk1ZL2t2bmp4a1dvTlRUSEtjMUtPb0lGak9NSExENTZOMzVsM3d2?=
	=?utf-8?B?SzAxcFJ1a2ZCaDdhaCtKV3ZxczNuNGtIQkx2TmU4STR0SU4rQlZPMlVTQVJn?=
	=?utf-8?B?azI3SmJoaTBZSCtQaEFTTU5mNzNGak94SEs1S1NsWEQvU1RuUkdZcm10Nm11?=
	=?utf-8?B?VWJ3NkpUSnZwSlBoVmVHbW9KaVFtUzYrVHV1ZGxQOUdkbTdGUFdWdElFOTBM?=
	=?utf-8?B?aDBuYS83SnF3YWNLdW5QcnVLSUtlTk5aS29QK29qbmZUSnVrb29TZllVM0ww?=
	=?utf-8?B?T2NMWC9mcnhuNDZ4WXNIUk9sK2VNSWpQS1Q3K2FLbmxhdzVXdm5ER25BTzZZ?=
	=?utf-8?B?NStOSWNmODdGRnhjRERPUExIVitzdGhXeHpnMVNTdGxPODIySURld0FuYzNE?=
	=?utf-8?B?L1pFZWdnKzNrQjh0cjhnOXZCZVpPQ1A2RHlubExsc1N1bzZ1OHd3KzVLR1Yv?=
	=?utf-8?B?dHhGeGN5ckNQcEM3SVNOUkhoN2E2YW51Qyt5TmVPMjZlNFB1V3lVako2S0Nv?=
	=?utf-8?B?QllsMmgvOXc4azZJYUtuOVIwNGNyVnMzcDVzMVduY1F3OXNOcXdWN0srbFJW?=
	=?utf-8?B?aXV1K2ZUNlF2S2pNMmhMaW8wZVd6QXVkWk1PTk5pbDh0TDBjeVpqMFhwTkZW?=
	=?utf-8?B?WWswRzRicmpIazM3YUtKbGtJb3orb2xMT2VGWmVPU0krcmhoSEhlVUtUS2p6?=
	=?utf-8?B?NXBuL1lDWnJiSXowQTN3aVhXMFk4N1NjQlpWU0hFcWVzVU9UWDJ2OU93ZldF?=
	=?utf-8?B?ZkZTcXQ2bzBZT0VpTkZFUmtEYjZFalhiUXN6Q2VCMXFCd0RYZ2grTEZPRGxR?=
	=?utf-8?B?dnEwNjhMa1BpTW5Sd2lmWC94RDFPdG1VZkt0Sjc1OW9TRzlEOWtURlpVMVZ5?=
	=?utf-8?B?OEdDVlBnODYzbHdHd3NYT1ZlR3NCbGZDNW0xWnE1NEtFdzVwNHN6UFdXdWc5?=
	=?utf-8?B?ZmVTU1VyRkNjUUdZcVFuVkFFcmlsZSt1OHpFbHFvTTZ4UVJhUGlobXBZaXhB?=
	=?utf-8?B?aHNiVlJzSDIrcThLTVdkdXVzaHR3aTFEVTNIc09HanMvQjlzbGxwZnJ1TWg1?=
	=?utf-8?B?dnZ2YTdZUkprWVg0TnFFaURpZnI1QXNOdTlFUlA1SG9scEhKRFZQR0hvMG1h?=
	=?utf-8?B?MUhnanBFVlNkN3ZUbUNsSzdEem1JMTFXdW9CZU5URDVndWFYaFpNT01zUFRj?=
	=?utf-8?B?UXpqQ0N3YzVtK3RIZjkzY1M1OHJWbUdJemxkVzI2SlZmYlBOZXdyZ3lIWUxK?=
	=?utf-8?B?NzJuUVNTK1dqSDBWYytFRUJBQ2ZmRFZ1bjhrRnQxRnlSLyttNU1qQ0srT0dn?=
	=?utf-8?B?V1JkQ3lkY2J6bENLMEU4d0ExNGVlcFRpQ29ESFUrYkd5cE5KV2h5TktxczdB?=
	=?utf-8?B?OFJ0REt1VnovSUNONE0yaHZHQzJ3LzQ3TncwWHFmWEsvY1cwVEdaYWYyNDJE?=
	=?utf-8?B?cW1wODFxb2FZTVZJajd2VlJ2V01vTVBBazJJeHlYOEVLL09FbW1QVjNNNTlE?=
	=?utf-8?B?Y3hnTkl1YWsvT1R3MWw0M21KKzBKZ1BYL1NFVXpna2VmVk4yOUx3MFJNVzgr?=
	=?utf-8?B?endwai9wNUQya1FjM1NCeTVTTDQrR3g4OTIwUHNvbzZ4azNjZmE4eHU5N1Zy?=
	=?utf-8?B?NWxNQUc3b0x0NEw4SXhEMDludVd1eE1GNm5senAveXpKWWJkZ01lYVc0NVNz?=
	=?utf-8?B?cG95Q0dqaTFWRHk4QUI3MG5mMWU1UExZZnpwNmVDZmIxVnA4bExOc3NKMTAy?=
	=?utf-8?B?QXV1NEhhclFkSGhUWVVlbGFPOFNkdVhuUU5UdlpQLy9ZV2NUV3BNQnBJcDEx?=
	=?utf-8?B?cHZmdUdpUmhuRUIxWkd3TUw4cUNvRW1aQWt5UDQ5TUI0aERLb3pPbG1maWVS?=
	=?utf-8?Q?dVKXqOtzOxhNPL3k8NHNkYVjQ?=
X-Microsoft-Antispam-Message-Info: bACKLcprgUnF+0BtxhqcuLWPLRTv8VxED/R+CZZAKnA7ZVUBjXuUqEK/BnhDL+WoCa14G8bVtfT47mxh9F0zUIlw06UYHMt15UTOGSMc88870ow6ws110w0YapFK74/eB5nXMbVhoA0XAo3wqoLfKeFzDWvPVGa2rqzXLtec9lii7NqeyLVVGky33j+p+cIL
X-Microsoft-Exchange-Diagnostics: 1; HE1P192MB0059;
	6:pSwdwAVq28Ces6LpMHNNPkN1nHg8JxOBYx05317oMZ8Qg8ww4CzJudeCcncvVj4aSloH+H75tfqj7yBL9VHorIabXPWJnnqC8HAx4WhxLPXH3Gc4vB/PYygrtSYvhLgufSn/fA4+z3kXplNxLvDwG2kIU5UbwK7mItLiOxyROmdUHm97nd4Ci6+KgsTnUkZA+0TApqDdm9jusEarvJr5iwHSwh5Bww2uDcP3vX9T5LyBKxP6oxmvt/KK8NF53pPdu3VDnVJIGm8kVLnxrJe1YEOPBlWlyuKCVXV1mcETQZARF0pZmnc4OQQCfaj43uoicAaZvkFNTZdvz+wVKq/pPxp5ymiaUOHtNiNe95/XpxlL/VddVC+HQWWvCaLSYac4eEggTcA+Tz3ZIwj7K9uicXbqNxJqqellYAlgsrvojL8n8A7rjVNxDTWJq64BVtZVIueox3Kocu/5L+NGZlnMqw==;
	5:62raW7uG3YN3oFfExvWTEpmsK4LHnZWbj0gVCHohptcjT2YOVsyevnW1UuOKUl38aV3EW9zy4lZYLrPdo/3XfZSTQnDLLH9adEB/g/7o+8fHTuooDheLJT70p/ilhhXdIF7rP/c6m9sRy7Axh1KALuy/OPDvLqmvHZ79eToTdOA=;
	24:7C53DIgFIURsk7Z/LZp2YypmvewghPPz3ngU/ifEArMlPd7SEJswt3oCPDzyiQZ2mROf90Q/e3lZAOsdTGUtAhp1PbDiF5IXjLBEExzjD4M=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; HE1P192MB0059;
	7:LtKqM6fXKV3iPJrAUmOWcPUq9jzFkOxa/9r/1C//K6on80jxCME2kgxeNXzs1ol/PUF/9VjY4vZbFCJb+dTgzqhNdVVehJWca3RD/DL5FrsFRQhGcVDma7HJpKd0LOY3uPNYPeS9x3riLYpKtXFNAv8sVceWgju5Fei+JZaIgRiSaAIlBakQDtcSBxSDnHaN26P/Qs9EXtEozHwXc7Fct9VbPwDq93dQDHM6VPRVZFU/d57GbnGgBOF7tZQQGEnk
X-MS-Office365-Filtering-Correlation-Id: 74144a45-45e9-4436-2407-08d5cbba7014
X-OriginatorOrg: qiio.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2018 14:33:14.3610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74144a45-45e9-4436-2407-08d5cbba7014
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7110674e-f830-4f7f-87a8-a46973e4c75f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1P192MB0059
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Andrii Voloshyn <andrii.voloshyn@qiio.com>,
	jakob.hasse@smart-home-technology.ch
Subject: [Resolved] Re: cgroups and iptables problems running docker - maybe my config wrong?
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
X-List-Received-Date: Wed, 06 Jun 2018 17:06:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE

Hello Bruce, hello Yoctoers,

my problem is solved. It was the kernel options. I added all additional 
kernel options which this check-script here suggests: 
https://github.com/moby/moby/blob/master/contrib/check-config.sh. This 
script was a big help

Finally, docker runs, with one ERROR message and one WARNING though, but 
it does :) If I have more problems, I'll come back to the list.

Thank you for the help so far.

All the Best,
Jakob

On 05.06.2018 18:23, Jakob Hasse wrote:
> Hello,
>
> right now, there is no insmod warning anymore, only iptables does 
> still not work with the nat table:
>
> root@ccimx6uluvalue:~# dockerd
> INFO[0000] libcontainerd: new containerd process, pid: 1003
> WARN[0000] containerd: low RLIMIT_NOFILE changing to max current=1024 
> max=4096
> INFO[0001] [graphdriver] using prior storage driver: overlay2
> INFO[0001] Graph migration to content-addressability took 0.00 seconds
> WARN[0001] Your kernel does not support cgroup memory limit
> WARN[0001] Unable to find cpu cgroup in mounts
> WARN[0001] Unable to find blkio cgroup in mounts
> WARN[0001] Unable to find cpuset cgroup in mounts
> WARN[0001] mountpoint for pids not found
> INFO[0001] Loading containers: start.
> Error starting daemon: Error initializing network controller: error 
> obtaining controller instance: failed to create NAT chain: iptables 
> failed: iptables --wait -t nat -N DOCKER: iptables v1.6.1: can't 
> initialize iptables table `nat': Table does not exist (do you need to 
> insmod?)
> Perhaps iptables or your kernel needs to be upgraded.
>  (exit status 3)
>
> Best Regards,
> Jakob
>
> On 05.06.2018 18:11, Jakob Hasse wrote:
>> On 04.06.2018 17:53, Bruce Ashfield wrote:
>>> On 2018-06-01 12:15 PM, Jakob Hasse wrote:
>>>> Hello Bruce,
>>>>
>>>> Thank you very much for the quick response. I tried to built in the 
>>>> kernel changes. But the iptables error persists.
>>>
>>> I double checked over the weekend, and I have no problems with
>>> linux-yocto + the meta-virtualization fragment and docker.
>> Thanks a lot for the work!
>>>
>>> Did you say that you confirmed on target via /proc/config.gz that
>>> all the options you tried to enable are still present in the running
>>> kernel ?
>> I double checked with /proc/config.gz and all the modules are 
>> builting except for CONFIG_NF_TABLES, CONFIG_NF_TABLES_IPV4. The last 
>> two might not even exists, I was so desperate that I put everything 
>> into the configuration which I could find related to NAT.
>> Some modules are builtin as modules instead (...=m instead of ...=y), 
>> however.
>>>
>>>> Eventually, I tried to enable systemd again and it still breaks my 
>>>> build -.-:
>>>>
>>>> test$ bitbake core-image-base
>>>> NOTE: Started PRServer with DBfile: 
>>>> /home/build/test/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 40169, 
>>>> PID: 2335
>>>> Loading cache: 100% 
>>>> |########################################################################################################| 
>>>> Time: 0:00:00
>>>> Loaded 3023 entries from dependency cache.
>>>> Parsing recipes: 100% 
>>>> |######################################################################################################| 
>>>> Time: 0:00:01
>>>> Parsing of 2194 .bb files complete (2193 cached, 1 parsed). 3024 
>>>> targets, 146 skipped, 0 masked, 0 errors.
>>>> NOTE: Resolving any missing task queue dependencies
>>>>
>>>> Build Configuration:
>>>> BB_VERSION           = "1.36.0"
>>>> BUILD_SYS            = "x86_64-linux"
>>>> NATIVELSBSTRING      = "universal"
>>>> TARGET_SYS           = "arm-dey-linux-gnueabi"
>>>> MACHINE              = "ccimx6ulstarter"
>>>> DISTRO               = "dey"
>>>> DISTRO_VERSION       = "2.4-r1"
>>>> TUNE_FEATURES        = "arm armv7ve vfp thumb neon 
>>>> callconvention-hard cortexa7"
>>>> TARGET_FPU           = "hard"
>>>> meta
>>>> meta-poky
>>>> meta-yocto-bsp       = "HEAD:3befe6d7b7fa8c8481519aa8dd0cae52207ad339"
>>>> meta-oe
>>>> meta-python
>>>> meta-networking
>>>> meta-webserver       = "HEAD:dacfa2b1920e285531bec55cd2f08743390aaf57"
>>>> meta-qt5             = "HEAD:cfe02f26de53e5c20e6f9555059cbaaf5ab9b22f"
>>>> meta-swupdate        = "HEAD:6e4eab4f475b0129d6510815a3bbc4748c97dbbe"
>>>> meta-freescale       = "HEAD:d6141ea291a1ac9ab8fb1dd1110d408f840fda57"
>>>> meta-fsl-demos       = "HEAD:0ec6d7e206705702b5b534611754de0787f92b72"
>>>> meta-digi-arm
>>>> meta-digi-dey        = "HEAD:1246ecff2cecea9247d94f36385608ac844d7abb"
>>>>
>>>> Initialising tasks: 100% 
>>>> |###################################################################################################| 
>>>> Time: 0:00:04
>>>> NOTE: Executing SetScene Tasks
>>>> NOTE: Executing RunQueue Tasks
>>>> ERROR: core-image-base-1.0-r0 do_rootfs: Could not invoke dnf. 
>>>> Command 
>>>> '/home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/recipe-sysroot-native/usr/bin/dnf 
>>>> -y -c 
>>>> /home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/rootfs/etc/dnf/dnf.conf 
>>>> --setopt=reposdir=/home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/rootfs/etc/yum.repos.d 
>>>> --repofrompath=oe-repo,/home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/oe-rootfs-repo 
>>>> --installroot=/home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/rootfs 
>>>> --setopt=logdir=/home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/temp 
>>>> -x udev-cache --nogpgcheck install locale-base-en-us 
>>>> locale-base-en-gb packagegroup-core-boot 
>>>> packagegroup-core-eclipse-debug run-postinsts 
>>>> packagegroup-dey-bluetooth psplash packagegroup-core-ssh-dropbear 
>>>> packagegroup-dey-network packagegroup-base-extended 
>>>> packagegroup-dey-audio packagegroup-dey-wireless rpm dnf' returned 1:
>>>> Added oe-repo repo from 
>>>> /home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/oe-rootfs-repo 
>>>>
>>>> Last metadata expiration check: 0:00:00 ago on Fri 01 Jun 2018 
>>>> 03:49:44 PM UTC.
>>>> Error:
>>>>   Problem: package packagegroup-base-1.0-r83.0.ccimx6ulstarter 
>>>> requires packagegroup-distro-base, but none of the providers can be 
>>>> installed
>>>>    - package packagegroup-base-extended-1.0-r83.0.ccimx6ulstarter 
>>>> requires packagegroup-base, but none of the providers can be installed
>>>>    - package packagegroup-distro-base-1.0-r83.0.ccimx6ulstarter 
>>>> requires packagegroup-dey-core, but none of the providers can be 
>>>> installed
>>>>    - conflicting requests
>>>>    - nothing provides busybox-hwclock needed by 
>>>> packagegroup-dey-core-1.0-r0.0.ccimx6ulstarter
>>>>
>>>> ERROR: core-image-base-1.0-r0 do_rootfs: Function failed: do_rootfs
>>>> ERROR: Logfile of failure stored in: 
>>>> /home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/temp/log.do_rootfs.2380 
>>>>
>>>> ERROR: Task 
>>>> (/usr/local/dey-2.4/sources/poky/meta/recipes-core/images/core-image-base.bb:do_rootfs) 
>>>> failed with exit code '1'
>>>> NOTE: Tasks Summary: Attempted 4106 tasks of which 4105 didn't need 
>>>> to be rerun and 1 failed.
>>>>
>>>> Summary: 1 task failed:
>>>> /usr/local/dey-2.4/sources/poky/meta/recipes-core/images/core-image-base.bb:do_rootfs 
>>>>
>>>> Summary: There were 2 ERROR messages shown, returning a non-zero 
>>>> exit code.
>>>>
>>>> Seems that the introduction of systemd "confuses" dnf. I found a 
>>>> quite similar description in this bugreport here:
>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12025
>>>> only that I'm not using different machines. This bug doesn't seem 
>>>> to be resolved yet.
>>>>
>>>> Our Yocto-distribution is DIGI Embedded Yocto. So non-standard.
>>>> Shall I still log a bug against oe-core?
>>>
>>> You could, but without a reproducer on oe-core, chances are that it
>>> won't be easily resolved.
>>>
>>> At a glance, it isn't clear to me how systemd is causing your 
>>> busybox-hwclock
>>> issue. But if you check the list, that particular package has recently
>>> been moved around/broken out. So I'd suggest making sure that all of
>>> your layers are on the correct branches and that releases aren't being
>>> mixed.
>> Our hardware supplier told me that systemd is broken in their 
>> distribution and recommended to try it without systemd. That's what 
>> I'm doing right now.
>>
>> Thank you again for all the information already. All the Best,
>> Jakob
>>>
>>> Bruce
>>>
>>>> If someone here has some more helpful ideas, I would be very thankful.
>>>>
>>>> All the Best,
>>>> Jakob
>>>>
>>>> On 31.05.2018 13:44, Bruce Ashfield wrote:
>>>>> On 2018-05-31 7:00 AM, Jakob Hasse wrote:
>>>>>> Hello,
>>>>>
>>>>> Make sure to cc meta-virtualization on questions like this, since
>>>>> that is where you'll get more eyes that are running docker
>>>>> all the time.
>>>>>
>>>>>> I ran into trouble running docker on our target.
>>>>>> 1. When I want to start docker, I first have to re-mount cgroups:
>>>>>> root@target:~# cgroups-umount
>>>>>> root@target:~# cgroups-mount
>>>>>> Otherwise docker would produce an error:
>>>>>> ERRO[0002] Failed to built-in GetDriver graph btrfs /var/lib/docker
>>>>>>
>>>>>> 2. When I then start dockerd, it complains about a missing nat 
>>>>>> table:
>>>>>> root@target:~# dockerd
>>>>>> INFO[0000] libcontainerd: new containerd process, pid: 929
>>>>>> WARN[0000] containerd: low RLIMIT_NOFILE changing to max 
>>>>>> current=1024 max=4096
>>>>>> INFO[0001] [graphdriver] using prior storage driver: overlay2
>>>>>> INFO[0001] Graph migration to content-addressability took 0.00 
>>>>>> seconds
>>>>>> WARN[0001] Your kernel does not support cgroup memory limit
>>>>>> WARN[0001] Unable to find cpu cgroup in mounts
>>>>>> WARN[0001] Unable to find blkio cgroup in mounts
>>>>>> WARN[0001] Unable to find cpuset cgroup in mounts
>>>>>> WARN[0001] mountpoint for pids not found
>>>>>> INFO[0001] Loading containers: start.
>>>>>> WARN[0001] Running modprobe nf_nat failed with message: 
>>>>>> `modprobe: WARNING: Module nf_nat not found in directory 
>>>>>> /lib/modules/4.9.81-dey+g2c6ae4c`, error: exit status 1
>>>>>> WARN[0001] Running modprobe xt_conntrack failed with message: 
>>>>>> `modprobe: WARNING: Module xt_conntrack not found in directory 
>>>>>> /lib/modules/4.9.81-dey+g2c6ae4c`, error: exit status 1
>>>>>> Error starting daemon: Error initializing network controller: 
>>>>>> error obtaining controller instance: failed to create NAT chain: 
>>>>>> iptables failed: iptables --wait -t nat -N DOCKER: iptables 
>>>>>> v1.6.1: can't initialize iptables table `nat': Table does not 
>>>>>> exist (do you need to insmod?)
>>>>>> Perhaps iptables or your kernel needs to be upgraded.
>>>>>>   (exit status 3)
>>>>>>
>>>>>> Our configuration is as suggested here: 
>>>>>> https://wiki.yoctoproject.org/wiki/TipsAndTricks/DockerOnImage, 
>>>>>> except 
>>>>>
>>>>> I've never seen that wiki page before (or at least I don't remember
>>>>> seeing it), so I can't confirm or deny the validity of the content :)
>>>>>
>>>>>> that I don't include the system systemd stuff  (it lets my build 
>>>>>> fail) 
>>>>>
>>>>> If systemd is breaking your build, make sure to log a bugzilla 
>>>>> against
>>>>> oe-core
>>>>>
>>>>>> and connman (using NetworkManager).
>>>>>> Furthermore, I added the following lines to the kernel bbappend 
>>>>>> file:
>>>>>>
>>>>>> # remove old defconfig
>>>>>> SRC_URI_remove = " defconfig"
>>>>>> # replace with new defconfig
>>>>>> SRC_URI_append = " file://defconfig"
>>>>>>
>>>>>> KERNEL_FEATURES_append = " features/cgroups/cgroups.scc "
>>>>>>
>>>>>> I also added a lot of configurations manually to the defconfig 
>>>>>> (mostly via menuconfig) to enable NAT:
>>>>>>
>>>>>> CONFIG_CGROUP_DEVICE=y
>>>>>> CONFIG_IP_MULTICAST=y
>>>>>> CONFIG_IP_ADVANCED_ROUTER=y
>>>>>> CONFIG_NETFILTER=y
>>>>>> CONFIG_NF_CONNTRACK=y
>>>>>> CONFIG_NF_TABLES=y
>>>>>> CONFIG_NF_NAT=y
>>>>>> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y
>>>>>> CONFIG_NETFILTER_XT_MATCH_COMMENT=y
>>>>>> CONFIG_NETFILTER_XT_MATCH_HL=y
>>>>>> CONFIG_NETFILTER_XT_MATCH_IPRANGE=y
>>>>>> CONFIG_NETFILTER_XT_MATCH_LIMIT=y
>>>>>> CONFIG_NETFILTER_XT_MATCH_MULTIPORT=y
>>>>>> CONFIG_NETFILTER_XT_MATCH_RECENT=y
>>>>>> CONFIG_IP_VS=y
>>>>>> CONFIG_NF_TABLES_IPV4=y
>>>>>> CONFIG_IP_NF_IPTABLES=y
>>>>>> CONFIG_IP_NF_NAT=y
>>>>>> CONFIG_IP_NF_FILTER=y
>>>>>> CONFIG_IP_NF_MANGLE=y
>>>>>> CONFIG_IP6_NF_IPTABLES=y
>>>>>> CONFIG_IP6_NF_FILTER=y
>>>>>> CONFIG_IP6_NF_MANGLE=y
>>>>>> CONFIG_BTRFS_FS=y
>>>>>> CONFIG_OVERLAY_FS=y
>>>>>>
>>>>>> Apart from that, I added virtualization and aufs as 
>>>>>> DISTRO_FEATURE in local.conf and also enabled it in menuconfig.
>>>>>>
>>>>>> But I still keep getting the above mentioned iptables error when 
>>>>>> trying to start docker. All this hassle makes me suspicious, 
>>>>>> especially as I'm quite sure that I once had docker running 
>>>>>> already with an image on our target and it wasn't that hard. So 
>>>>>> maybe it's just a misconfiguration and I need to add something in 
>>>>>> local.conf or the kernel recipe? Is systemd necessary? Or am I 
>>>>>> missing some life-or-death kernel configuration? It would also be 
>>>>>> nice if I could avoid the cgroup re-mounting before starting docker.
>>>>>
>>>>> What release branch are you using ?
>>>>>
>>>>> I'm running docker from meta-virt every day, as are many others,
>>>>> but you have several differences in your configuration.
>>>>>
>>>>>  - most use systemd as the init manager, I know that I do. That
>>>>>    is going to impact how cgroups is set up on your 'host' image.
>>>>>    You shouldn't need to touch cgroups at all if systemd is used,
>>>>>    since it is correct out of the box.
>>>>>
>>>>>  - You are using a different kernel and kernel configuration.
>>>>>    linux-yocto + the configuration fragments in the layer are what
>>>>>    is routinely tested. Are you using linux-yocto, or something
>>>>>    different ? If it is different, all you can do is run the various
>>>>>    checks to make sure that the docker prereqs are in place.
>>>>>
>>>>>    The errors you see in dockerd tells me that the options you are
>>>>>    turning on, are not making it into the final kernel that is
>>>>>    running on target.
>>>>>
>>>>> Cheers,
>>>>>
>>>>> Bruce
>>>>>
>>>>>>
>>>>>> Thanks for every answer!
>>>>>> All the Best,
>>>>>> Jakob
>>>>>>
>>>>>
>>>>
>>>
>>


