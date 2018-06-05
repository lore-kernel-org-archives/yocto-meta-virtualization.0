Return-Path: <jakob.hasse@qiio.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BB049E01164; Tue,  5 Jun 2018 15:55:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.2.49 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0049.outbound.protection.outlook.com [104.47.2.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 143D3E00CE2;
	Tue,  5 Jun 2018 15:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=smarthometechnologych.onmicrosoft.com; s=selector1-qiio-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Hhmri+XlPmm2z34jh86fB4Giv33lP8s+hN7gnu6Pluc=;
	b=bc0OeuQ8ZFzO9EZewHlW5hLZ7R7MyHnx6ZTFeFGKar6IsknrUM2XnG6cqwgH87U0jzVf3wZqa2qDx4ev06r3aq/kGgXA6+yAVmr/GIFo5odyxHNh3FFa2TEHzN3zUFi+lH8NpO5vDNdhAGSNKzrm7BilX6pQSuqI79NVO/nyP3s=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=jakob.hasse@qiio.com; 
Received: from [IPv6:2a02:168:6893:1:6569:b397:3591:3cfa]
	(2a02:168:6893:1:6569:b397:3591:3cfa) by
	VI1P192MB0062.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:c1::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.13; Tue, 5 Jun 2018 16:23:16 +0000
From: Jakob Hasse <jakob.hasse@qiio.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Yocto List <yocto@yoctoproject.org>
References: <783ff7cd-c1d8-1802-4b67-3aff339aae31@smart-home-technology.ch>
	<6391ddea-802d-7f4d-26b3-44a79556c8a0@windriver.com>
	<761e6979-b696-04f6-6e62-e325bc979c38@smart-home-technology.ch>
	<80617b66-6714-03f6-f6e7-45afc4def6d5@windriver.com>
	<a8aa1583-28fe-065b-f4d9-c8cfd90a5ead@smart-home-technology.ch>
Message-ID: <4b1fb073-e2f1-0d51-a5d8-a431e581d59d@qiio.com>
Date: Tue, 5 Jun 2018 18:23:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <a8aa1583-28fe-065b-f4d9-c8cfd90a5ead@smart-home-technology.ch>
X-Originating-IP: [2a02:168:6893:1:6569:b397:3591:3cfa]
X-ClientProxiedBy: VI1PR07CA0129.eurprd07.prod.outlook.com
	(2603:10a6:802:16::16) To VI1P192MB0062.EURP192.PROD.OUTLOOK.COM
	(2603:10a6:800:c1::20)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(2017052603328)(7153060)(7193020);
	SRVR:VI1P192MB0062; 
X-Microsoft-Exchange-Diagnostics: 1; VI1P192MB0062;
	3:dW9P1Xx0es3MYstbR2dDWvMFOX1k+Ve8mVbO+Lh9g/lzqLb5269wlt5RUBLssZfxziOt+XCotAQBjZB8cuqyLDkp351D5kdSazHWB/ZxN+EVDge44EVxbmds8MPB7vmqwkNn6TndLt8HFLeIgWUImDhNdHZUc9vWCY1yi1exzPkLRu3gzGdg+rkN5M82549RdDnb9piNdERAq/epIsE+SC85/2+r5BHxL8oDpC8ypXYpDBvvGpU5LALRoJrRKs7j;
	25:TUm2Vt1Y1Fson3fAx5IwPNDq5Wysy1Qfo8KyPQNn1+SxIkhRGnciWm0lVp6efprkzuku+eJmy+9EgkMHwLjM715NxwSvtlV6PcVWLna9f4BQ/zj/N1qkIQ+oswP6CqXBbLNzBdUzkE02+YDCyuVyRNdrvpdoBTM4ziqlClDzxXyqiNHooIshblSrBTofOhcDaFpRq4oEZwJNevhAV5bpmFIZlUmlRGIgLCaE+oT0s1SsN8jLKqfGeOxnztWa64XP6HbM+gFsUdyZI5olGv4TWJc4GB1vnqZ6CfbfFmI3mjtLbu0rJCkHD7hrzSTW+zQuwSLHWp9DMfYXpy2WuiLfBQ==;
	31:oNCruMCnu/TpRBrMwp51JiI5joPcC9WMk7yaVFlCrgOjBnswjiZ5Hw9ZcUdqxBrY3tPxJies1lCco/kJFvaPAdK23ZwKJWByRc6p3iWPRuQIn1p2xNlXGlkM7poPGIP76je9bjvRS8kX+rX8oBh3kEZYIJ0cICliBVG7HNYiAkUsYIwl2YnDKTUN6e7W7TIhPqkWw2Hu3bP9zU0vi0PQ3FLyLJHXe+8fckRrBhBDc4Q=
X-MS-TrafficTypeDiagnostic: VI1P192MB0062:
X-Microsoft-Antispam-PRVS: <VI1P192MB00624EE7C8B2338A3556A67684660@VI1P192MB0062.EURP192.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231254)(944501410)(52105095)(3002001)(93006095)(93001095)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(2016111802025)(6043046)(6072148)(201708071742011)(7699016);
	SRVR:VI1P192MB0062; BCL:0; PCL:0; RULEID:; SRVR:VI1P192MB0062; 
X-Microsoft-Exchange-Diagnostics: 1; VI1P192MB0062;
	4:/kkct+u+afYYbT68S8DRxYgDfFR9/8Lwg79jQbIVrsX/4gOAAoeQKjmnUbogDfbCNTNPZQmH6gbstwU0LoVyU7414syWbeGTS0Ypw35lR05bfVbEmTmwZVS6oiLWXTnTWpc4KtueClLWjE/gZIwBeSgT8HmKhHadO26nOqUK3+WZdJfXcoFD9I0QA15Uz1aLG/J8rijjqGZxz0q5/cztZyLP4kBYgkJqcdOJAjy6gCS0+5DRozI/Qm35cxaMQDpCDS735fMDd9ap3iCvaj8TLPWOGKrpHflDs/wvVjL5th32C7OVcMTB/XS3utzo95pL
X-Forefront-PRVS: 0694C54398
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(366004)(396003)(39830400003)(376002)(346002)(39380400002)(189003)(199004)(65826007)(50466002)(46003)(105586002)(25786009)(106356001)(67846002)(64126003)(8936002)(229853002)(386003)(53546011)(575784001)(59450400001)(5660300001)(31686004)(4326008)(86362001)(68736007)(36756003)(76176011)(52396003)(2486003)(6246003)(23676004)(52146003)(478600001)(476003)(2616005)(2906002)(486006)(44832011)(47776003)(11346002)(446003)(8676002)(110136005)(16526019)(97736004)(107886003)(31696002)(316002)(81166006)(54906003)(81156014)(58126008)(6666003)(65956001)(6486002)(93886005)(6306002)(1706002)(305945005)(2870700001)(7736002)(65806001)(53936002)(966005)(6116002)(52116002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1P192MB0062;
	H:[IPv6:2a02:168:6893:1:6569:b397:3591:3cfa]; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: qiio.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQMTkyTUIwMDYyOzIzOnB1ejE0WGY4dDcwSmVVMVlnQnpubDNTL3JZ?=
	=?utf-8?B?MjBON3lJVFlxNktJejIyanFJOE92Q3lQWHYvNDZrODNDdDVPcVFPZkE2YkEw?=
	=?utf-8?B?MisyMmdDalBsM2NVK01IYVlrSk40M0R3NlpRQ3RnVWVNZWVjaFNrZWdKZkw5?=
	=?utf-8?B?UGJicEpsandNNlR1UUhJZHUvQ2NPdGZuRHhiaC9VNUFpMGdMVEN2Z052K3Ja?=
	=?utf-8?B?SWJmSHpuNzRjZ0FBOGdVZjYwWFFkVkxyVGU3UzVMTUhkNTRPL3FtRVFYQVNp?=
	=?utf-8?B?Ni9xY1ZGKzVUY1lSbEtpa2l0UUlLMW83d0tWTGN3ZHVQdW4zdG93NVEwZDQx?=
	=?utf-8?B?czAxV1NKZDhyVVQzbEE2NXZtYTFITHR4SWYzdkFOWjI0VVFsMlp3SUlITWRV?=
	=?utf-8?B?Q2tnVGJOVUJzT0VMZllYaGtpVUVueDBpVEY4QUtKTjN5UVVuU0s3YnM2U3E5?=
	=?utf-8?B?RmgxczNlMU5BVVlnZmVlb2ovTVduV1E3dmEwV0tXL3M2T1Q4UVpOcjMvR3Mv?=
	=?utf-8?B?eW1ObmlFWW5yWWJDak5BdGM4blJVMHZSQ2FwcjYxZmZMeU5oVDZLdzV6dDFX?=
	=?utf-8?B?bzNPSmpsbWJDWUNadFFBWklja1V3TVBlODRzRE1YQjJqWnZXcUN4dHVSTTdx?=
	=?utf-8?B?R3AzNTJEdDVaQ2JWRkM3UVljN0dhc0tZbzZuL0NOU0w5ZTJ1S0tIVS8vNGpt?=
	=?utf-8?B?RG5JcXloYzJuZkp1dnJWeW8xTldwanZNRVU2OFAzZzQyay96ekVieEV3WkNX?=
	=?utf-8?B?VU1UcHowclJDUm8wQUxwWHRLM2Faenlva3FtcENISS9aMzNkZnZRUElUMUtq?=
	=?utf-8?B?bDU1TDE4NWlGN2lXUFhWcmF6akhZY1VTR3d6bGo2MnRwS2V5bHd2ZmFFQklt?=
	=?utf-8?B?OXdsRXhFREpqd3JPWmVvWFhnUjFlMkoyY0ZTVUhHZWtUSmFSNDhQNmwzQkYx?=
	=?utf-8?B?SlEwQkdqYVZ3cWpPOWxyVWlDVlIzSlNScnNPSEhEODJvR3F0UnMyaXhQVU9s?=
	=?utf-8?B?RzBxVE9CWlhUY0N2aHNwMklENU55WGF0VDI0d2l1NGUyWWdQVHNraGVEdVNz?=
	=?utf-8?B?b0dBOWVjZGNKYkRKMzlvUkNsSys3SmtMN1Njd2MzMm12dnc5NS80bEN2Qm9l?=
	=?utf-8?B?WjJoc1EzMlNIVStFcGF1cjZzRHp2YUlQMmt2Nm1qRGVHa3JiNS90RFozT291?=
	=?utf-8?B?MjYvdlRWcCtlaU0rcFRWb05sa2hyY3AxaGZ5ajlUeDRvYlFDV3VpWjdxUW5G?=
	=?utf-8?B?QmxQMlV3amdOYzdmZXBjSGF2dVl4Ti85L0ZHUjl3a09rZUM3L1pRdjNaWjRq?=
	=?utf-8?B?Q0paMGJsZ2FyOE1PdkcvcVQ4VnVvdGx5TjI0Ym5IVXNTRzdUNTlwaXk1SEN3?=
	=?utf-8?B?TTRCcUJwOU1YN2d1MmdTNzFydU1GeU5GaFd6SVgxcDFxWUxSNWQ5ck1oY21k?=
	=?utf-8?B?QWN0OUJ5QjlrbTVFdWdVV0Y3VzVmRXMyV2FkcmtEazJpejkvT2lKVVh4Uk9H?=
	=?utf-8?B?eU9OaFJWdDNFRFVWelVYUDU0MzRwaHdEeXljcG5rcUFvaWt4MWhwbkRtcTcz?=
	=?utf-8?B?SDNOZzVwazRycHp2RWcrM053TlJjK1BZamtqejFuVTVBbkxKT2Z5MGpYb1JV?=
	=?utf-8?B?cVdsYVNMWG05M0RRelRqYlp1b2tOZWI3RTFoOTZSWFY0SlNaRkNUYTdkQU4v?=
	=?utf-8?B?dldWZXVPTHkrTUhWSWxzSGh3QTMzSllKa25tWC9vek1qa2U4RDd6VERYTDBt?=
	=?utf-8?B?RWZjd1J1a2lPeVlJclJjcmUrelVCYkJLMnRDbnlzQUNHRG93UEZyWng2UGZE?=
	=?utf-8?B?dGxvdFBiLzc3NURmc1NLRU12NUg1S3lKSWhsL2FkZVNHK1k0dEhFVDZhTkNC?=
	=?utf-8?B?SlZ2QVRTRTgzWk9JY28waFlsQVBkZk9DbHZKZm1OTEhKN21yblJwTWEzZVg5?=
	=?utf-8?B?Vjg5YUIwT1U4WnBVeHp2VGFIRDQrYk0wNHkxUERHY0hDbXJDUzl5MHd5OGx3?=
	=?utf-8?B?SFNkY1NlVW9yK2ZZRnNKbTVwKzZvTFdkbGZhZTJ4RTVueThCWDM5QW5oVlI2?=
	=?utf-8?Q?Ku9Z+ADPIupy/5+z8wdyK1fKH?=
X-Microsoft-Antispam-Message-Info: stCKO5xjoqyGcMMCOs/41UD3eFTSBxCSXS7Yh96BZ5WGD3aWtbjpRM2Ro+5ATX4+zizjkzML26v01dlphF327PfWLi90IgPY2ETyC44PUYeOXvFoSApZLv6VHUMN4yT8GxpetR0+tE58aZWK5oBIziNpMhF4hUnttN2dOPxmjHNsR2yj4Uh9jZqwVxn3OdtL
X-Microsoft-Exchange-Diagnostics: 1; VI1P192MB0062;
	6:Xd7eMk+D5Nc9oWq67tiY+meOLtXlDxcsjCfDbUZ1sQazMiUrT5kdjIywirBiabG+Ug+l3tcA22DA408/nwpuyiP2yH0/aQFJpHOfHU3X1Uo7QDbnwDEFPRyJaVhtI7PJSUHJLhpWDt24V8TUIh7ziDJMORKqm7Jv5BbGBiu+ase0hpwQVP0QwRJDW2gyN9kAZWenUgy6jBgQyZ/AGzya0A7jD9gaU7jehMg4wyLl24Mc6Yg/+06jHBeX5AyVrZec0B/yRx3K2G1TPJ02phP2IdKzYy2LgJ4HIBFarpy3egBK7mDNw5WpHei3qUCcHUJ5CJaefrGDQ+96TJvVz64BVvG4fGe2pMc4BdJkQ6DtO6yKDnRFzCraMv1F7TCEbPcDEyFDKhj3gSp5KXbU55mK7G2GnAQrSU6sgl9GV7q3qKobXDKUg6G98zt/iVgWknpvNUa1ML3EQkNxlHtqwkY/Ww==;
	5:rADl89AIU2tdAd//Vu4n9MubyLgU4K71tr//Uf5zgpu2A973jyDAL8UdaBRmgAiOsXN1pfc++wTCqt3EeCpujv7tAWmN4JFa1M0TBPUGBbYVutmY4RK/h5oaLEk+Lv4wtAgSFcNOy5FKZi4FnpXnY/tujZGuv1YJ/GIWzQyczQg=;
	24:kMBUAfNPTSeJ3URXMpkPJBzckgF/uTkEKpNpoA1oCPgRBoFb3+AHPiwi8wyhybbz4S66PYQgVUyOq9CN2aq6/Npp+cYSLqbam7wzImM7sfs=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1P192MB0062;
	7:AuNI/inOEBWjUkepGIDNAPZ4MYdYdXpvS0U93wGumugdcewshP3cUazEILvJwtSJvmsqW046MAxR3xr8W+Xkw9fR8xN//x/qhIbePMLNjqLJq1RQjWPlfwlSEUgKkVBmGZRX6E+znyvK+gc/bnI2OAMIWUe0okwd1hFCV3rzyfINxSwuQfFzMjUWJvQrF78zZ9LN7f9A23BL/K7uKZPMRQ3ClOEif7en2ALNpZzdpyMkjcpFa5VJ1Y/rw2w2Zmuj
X-MS-Office365-Filtering-Correlation-Id: f4c300f9-a588-4d4c-64fd-08d5cb00a488
X-OriginatorOrg: qiio.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2018 16:23:16.2540 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c300f9-a588-4d4c-64fd-08d5cb00a488
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7110674e-f830-4f7f-87a8-a46973e4c75f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P192MB0062
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Andrii Voloshyn <andrii.voloshyn@qiio.com>,
	jakob.hasse@smart-home-technology.ch
Subject: Re: cgroups and iptables problems running docker - maybe my config wrong?
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
X-List-Received-Date: Tue, 05 Jun 2018 22:55:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE

Hello,

right now, there is no insmod warning anymore, only iptables does still 
not work with the nat table:

root@ccimx6uluvalue:~# dockerd
INFO[0000] libcontainerd: new containerd process, pid: 1003
WARN[0000] containerd: low RLIMIT_NOFILE changing to max current=1024 
max=4096
INFO[0001] [graphdriver] using prior storage driver: overlay2
INFO[0001] Graph migration to content-addressability took 0.00 seconds
WARN[0001] Your kernel does not support cgroup memory limit
WARN[0001] Unable to find cpu cgroup in mounts
WARN[0001] Unable to find blkio cgroup in mounts
WARN[0001] Unable to find cpuset cgroup in mounts
WARN[0001] mountpoint for pids not found
INFO[0001] Loading containers: start.
Error starting daemon: Error initializing network controller: error 
obtaining controller instance: failed to create NAT chain: iptables 
failed: iptables --wait -t nat -N DOCKER: iptables v1.6.1: can't 
initialize iptables table `nat': Table does not exist (do you need to 
insmod?)
Perhaps iptables or your kernel needs to be upgraded.
  (exit status 3)

Best Regards,
Jakob

On 05.06.2018 18:11, Jakob Hasse wrote:
> On 04.06.2018 17:53, Bruce Ashfield wrote:
>> On 2018-06-01 12:15 PM, Jakob Hasse wrote:
>>> Hello Bruce,
>>>
>>> Thank you very much for the quick response. I tried to built in the 
>>> kernel changes. But the iptables error persists.
>>
>> I double checked over the weekend, and I have no problems with
>> linux-yocto + the meta-virtualization fragment and docker.
> Thanks a lot for the work!
>>
>> Did you say that you confirmed on target via /proc/config.gz that
>> all the options you tried to enable are still present in the running
>> kernel ?
> I double checked with /proc/config.gz and all the modules are builting 
> except for CONFIG_NF_TABLES, CONFIG_NF_TABLES_IPV4. The last two might 
> not even exists, I was so desperate that I put everything into the 
> configuration which I could find related to NAT.
> Some modules are builtin as modules instead (...=m instead of ...=y), 
> however.
>>
>>> Eventually, I tried to enable systemd again and it still breaks my 
>>> build -.-:
>>>
>>> test$ bitbake core-image-base
>>> NOTE: Started PRServer with DBfile: 
>>> /home/build/test/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 40169, 
>>> PID: 2335
>>> Loading cache: 100% 
>>> |########################################################################################################| 
>>> Time: 0:00:00
>>> Loaded 3023 entries from dependency cache.
>>> Parsing recipes: 100% 
>>> |######################################################################################################| 
>>> Time: 0:00:01
>>> Parsing of 2194 .bb files complete (2193 cached, 1 parsed). 3024 
>>> targets, 146 skipped, 0 masked, 0 errors.
>>> NOTE: Resolving any missing task queue dependencies
>>>
>>> Build Configuration:
>>> BB_VERSION           = "1.36.0"
>>> BUILD_SYS            = "x86_64-linux"
>>> NATIVELSBSTRING      = "universal"
>>> TARGET_SYS           = "arm-dey-linux-gnueabi"
>>> MACHINE              = "ccimx6ulstarter"
>>> DISTRO               = "dey"
>>> DISTRO_VERSION       = "2.4-r1"
>>> TUNE_FEATURES        = "arm armv7ve vfp thumb neon 
>>> callconvention-hard cortexa7"
>>> TARGET_FPU           = "hard"
>>> meta
>>> meta-poky
>>> meta-yocto-bsp       = "HEAD:3befe6d7b7fa8c8481519aa8dd0cae52207ad339"
>>> meta-oe
>>> meta-python
>>> meta-networking
>>> meta-webserver       = "HEAD:dacfa2b1920e285531bec55cd2f08743390aaf57"
>>> meta-qt5             = "HEAD:cfe02f26de53e5c20e6f9555059cbaaf5ab9b22f"
>>> meta-swupdate        = "HEAD:6e4eab4f475b0129d6510815a3bbc4748c97dbbe"
>>> meta-freescale       = "HEAD:d6141ea291a1ac9ab8fb1dd1110d408f840fda57"
>>> meta-fsl-demos       = "HEAD:0ec6d7e206705702b5b534611754de0787f92b72"
>>> meta-digi-arm
>>> meta-digi-dey        = "HEAD:1246ecff2cecea9247d94f36385608ac844d7abb"
>>>
>>> Initialising tasks: 100% 
>>> |###################################################################################################| 
>>> Time: 0:00:04
>>> NOTE: Executing SetScene Tasks
>>> NOTE: Executing RunQueue Tasks
>>> ERROR: core-image-base-1.0-r0 do_rootfs: Could not invoke dnf. 
>>> Command 
>>> '/home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/recipe-sysroot-native/usr/bin/dnf 
>>> -y -c 
>>> /home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/rootfs/etc/dnf/dnf.conf 
>>> --setopt=reposdir=/home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/rootfs/etc/yum.repos.d 
>>> --repofrompath=oe-repo,/home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/oe-rootfs-repo 
>>> --installroot=/home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/rootfs 
>>> --setopt=logdir=/home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/temp 
>>> -x udev-cache --nogpgcheck install locale-base-en-us 
>>> locale-base-en-gb packagegroup-core-boot 
>>> packagegroup-core-eclipse-debug run-postinsts 
>>> packagegroup-dey-bluetooth psplash packagegroup-core-ssh-dropbear 
>>> packagegroup-dey-network packagegroup-base-extended 
>>> packagegroup-dey-audio packagegroup-dey-wireless rpm dnf' returned 1:
>>> Added oe-repo repo from 
>>> /home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/oe-rootfs-repo 
>>>
>>> Last metadata expiration check: 0:00:00 ago on Fri 01 Jun 2018 
>>> 03:49:44 PM UTC.
>>> Error:
>>>   Problem: package packagegroup-base-1.0-r83.0.ccimx6ulstarter 
>>> requires packagegroup-distro-base, but none of the providers can be 
>>> installed
>>>    - package packagegroup-base-extended-1.0-r83.0.ccimx6ulstarter 
>>> requires packagegroup-base, but none of the providers can be installed
>>>    - package packagegroup-distro-base-1.0-r83.0.ccimx6ulstarter 
>>> requires packagegroup-dey-core, but none of the providers can be 
>>> installed
>>>    - conflicting requests
>>>    - nothing provides busybox-hwclock needed by 
>>> packagegroup-dey-core-1.0-r0.0.ccimx6ulstarter
>>>
>>> ERROR: core-image-base-1.0-r0 do_rootfs: Function failed: do_rootfs
>>> ERROR: Logfile of failure stored in: 
>>> /home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/temp/log.do_rootfs.2380 
>>>
>>> ERROR: Task 
>>> (/usr/local/dey-2.4/sources/poky/meta/recipes-core/images/core-image-base.bb:do_rootfs) 
>>> failed with exit code '1'
>>> NOTE: Tasks Summary: Attempted 4106 tasks of which 4105 didn't need 
>>> to be rerun and 1 failed.
>>>
>>> Summary: 1 task failed:
>>> /usr/local/dey-2.4/sources/poky/meta/recipes-core/images/core-image-base.bb:do_rootfs 
>>>
>>> Summary: There were 2 ERROR messages shown, returning a non-zero 
>>> exit code.
>>>
>>> Seems that the introduction of systemd "confuses" dnf. I found a 
>>> quite similar description in this bugreport here:
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12025
>>> only that I'm not using different machines. This bug doesn't seem to 
>>> be resolved yet.
>>>
>>> Our Yocto-distribution is DIGI Embedded Yocto. So non-standard.
>>> Shall I still log a bug against oe-core?
>>
>> You could, but without a reproducer on oe-core, chances are that it
>> won't be easily resolved.
>>
>> At a glance, it isn't clear to me how systemd is causing your 
>> busybox-hwclock
>> issue. But if you check the list, that particular package has recently
>> been moved around/broken out. So I'd suggest making sure that all of
>> your layers are on the correct branches and that releases aren't being
>> mixed.
> Our hardware supplier told me that systemd is broken in their 
> distribution and recommended to try it without systemd. That's what 
> I'm doing right now.
>
> Thank you again for all the information already. All the Best,
> Jakob
>>
>> Bruce
>>
>>> If someone here has some more helpful ideas, I would be very thankful.
>>>
>>> All the Best,
>>> Jakob
>>>
>>> On 31.05.2018 13:44, Bruce Ashfield wrote:
>>>> On 2018-05-31 7:00 AM, Jakob Hasse wrote:
>>>>> Hello,
>>>>
>>>> Make sure to cc meta-virtualization on questions like this, since
>>>> that is where you'll get more eyes that are running docker
>>>> all the time.
>>>>
>>>>> I ran into trouble running docker on our target.
>>>>> 1. When I want to start docker, I first have to re-mount cgroups:
>>>>> root@target:~# cgroups-umount
>>>>> root@target:~# cgroups-mount
>>>>> Otherwise docker would produce an error:
>>>>> ERRO[0002] Failed to built-in GetDriver graph btrfs /var/lib/docker
>>>>>
>>>>> 2. When I then start dockerd, it complains about a missing nat table:
>>>>> root@target:~# dockerd
>>>>> INFO[0000] libcontainerd: new containerd process, pid: 929
>>>>> WARN[0000] containerd: low RLIMIT_NOFILE changing to max 
>>>>> current=1024 max=4096
>>>>> INFO[0001] [graphdriver] using prior storage driver: overlay2
>>>>> INFO[0001] Graph migration to content-addressability took 0.00 
>>>>> seconds
>>>>> WARN[0001] Your kernel does not support cgroup memory limit
>>>>> WARN[0001] Unable to find cpu cgroup in mounts
>>>>> WARN[0001] Unable to find blkio cgroup in mounts
>>>>> WARN[0001] Unable to find cpuset cgroup in mounts
>>>>> WARN[0001] mountpoint for pids not found
>>>>> INFO[0001] Loading containers: start.
>>>>> WARN[0001] Running modprobe nf_nat failed with message: `modprobe: 
>>>>> WARNING: Module nf_nat not found in directory 
>>>>> /lib/modules/4.9.81-dey+g2c6ae4c`, error: exit status 1
>>>>> WARN[0001] Running modprobe xt_conntrack failed with message: 
>>>>> `modprobe: WARNING: Module xt_conntrack not found in directory 
>>>>> /lib/modules/4.9.81-dey+g2c6ae4c`, error: exit status 1
>>>>> Error starting daemon: Error initializing network controller: 
>>>>> error obtaining controller instance: failed to create NAT chain: 
>>>>> iptables failed: iptables --wait -t nat -N DOCKER: iptables 
>>>>> v1.6.1: can't initialize iptables table `nat': Table does not 
>>>>> exist (do you need to insmod?)
>>>>> Perhaps iptables or your kernel needs to be upgraded.
>>>>>   (exit status 3)
>>>>>
>>>>> Our configuration is as suggested here: 
>>>>> https://wiki.yoctoproject.org/wiki/TipsAndTricks/DockerOnImage, 
>>>>> except 
>>>>
>>>> I've never seen that wiki page before (or at least I don't remember
>>>> seeing it), so I can't confirm or deny the validity of the content :)
>>>>
>>>>> that I don't include the system systemd stuff  (it lets my build 
>>>>> fail) 
>>>>
>>>> If systemd is breaking your build, make sure to log a bugzilla against
>>>> oe-core
>>>>
>>>>> and connman (using NetworkManager).
>>>>> Furthermore, I added the following lines to the kernel bbappend file:
>>>>>
>>>>> # remove old defconfig
>>>>> SRC_URI_remove = " defconfig"
>>>>> # replace with new defconfig
>>>>> SRC_URI_append = " file://defconfig"
>>>>>
>>>>> KERNEL_FEATURES_append = " features/cgroups/cgroups.scc "
>>>>>
>>>>> I also added a lot of configurations manually to the defconfig 
>>>>> (mostly via menuconfig) to enable NAT:
>>>>>
>>>>> CONFIG_CGROUP_DEVICE=y
>>>>> CONFIG_IP_MULTICAST=y
>>>>> CONFIG_IP_ADVANCED_ROUTER=y
>>>>> CONFIG_NETFILTER=y
>>>>> CONFIG_NF_CONNTRACK=y
>>>>> CONFIG_NF_TABLES=y
>>>>> CONFIG_NF_NAT=y
>>>>> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y
>>>>> CONFIG_NETFILTER_XT_MATCH_COMMENT=y
>>>>> CONFIG_NETFILTER_XT_MATCH_HL=y
>>>>> CONFIG_NETFILTER_XT_MATCH_IPRANGE=y
>>>>> CONFIG_NETFILTER_XT_MATCH_LIMIT=y
>>>>> CONFIG_NETFILTER_XT_MATCH_MULTIPORT=y
>>>>> CONFIG_NETFILTER_XT_MATCH_RECENT=y
>>>>> CONFIG_IP_VS=y
>>>>> CONFIG_NF_TABLES_IPV4=y
>>>>> CONFIG_IP_NF_IPTABLES=y
>>>>> CONFIG_IP_NF_NAT=y
>>>>> CONFIG_IP_NF_FILTER=y
>>>>> CONFIG_IP_NF_MANGLE=y
>>>>> CONFIG_IP6_NF_IPTABLES=y
>>>>> CONFIG_IP6_NF_FILTER=y
>>>>> CONFIG_IP6_NF_MANGLE=y
>>>>> CONFIG_BTRFS_FS=y
>>>>> CONFIG_OVERLAY_FS=y
>>>>>
>>>>> Apart from that, I added virtualization and aufs as DISTRO_FEATURE 
>>>>> in local.conf and also enabled it in menuconfig.
>>>>>
>>>>> But I still keep getting the above mentioned iptables error when 
>>>>> trying to start docker. All this hassle makes me suspicious, 
>>>>> especially as I'm quite sure that I once had docker running 
>>>>> already with an image on our target and it wasn't that hard. So 
>>>>> maybe it's just a misconfiguration and I need to add something in 
>>>>> local.conf or the kernel recipe? Is systemd necessary? Or am I 
>>>>> missing some life-or-death kernel configuration? It would also be 
>>>>> nice if I could avoid the cgroup re-mounting before starting docker.
>>>>
>>>> What release branch are you using ?
>>>>
>>>> I'm running docker from meta-virt every day, as are many others,
>>>> but you have several differences in your configuration.
>>>>
>>>>  - most use systemd as the init manager, I know that I do. That
>>>>    is going to impact how cgroups is set up on your 'host' image.
>>>>    You shouldn't need to touch cgroups at all if systemd is used,
>>>>    since it is correct out of the box.
>>>>
>>>>  - You are using a different kernel and kernel configuration.
>>>>    linux-yocto + the configuration fragments in the layer are what
>>>>    is routinely tested. Are you using linux-yocto, or something
>>>>    different ? If it is different, all you can do is run the various
>>>>    checks to make sure that the docker prereqs are in place.
>>>>
>>>>    The errors you see in dockerd tells me that the options you are
>>>>    turning on, are not making it into the final kernel that is
>>>>    running on target.
>>>>
>>>> Cheers,
>>>>
>>>> Bruce
>>>>
>>>>>
>>>>> Thanks for every answer!
>>>>> All the Best,
>>>>> Jakob
>>>>>
>>>>
>>>
>>
>

