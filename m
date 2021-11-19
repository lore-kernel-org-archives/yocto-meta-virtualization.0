Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.5661.1637305815381167465
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 23:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qK6UkY06;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=695783f828=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJ76QmI021017
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Nov 2021 23:10:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=izhdzZy7+SGAe0nzwTRRZcgXgBZ/8AMaK7k0+GcIkC8=;
 b=qK6UkY06wr8t+qoAii5zHGgE0oaepvEmkKni85mrk2K3+l+g4Oq8Bz72ZoIou/xl7G7/
 OPQj51iVes3Vv3WYbVTmJJqGI5XrDdg0Lnynwr1+85b5bE6vQkwC6Qpb8hHOxTvQXq2o
 EQbjcXrvphaf7fFYDFPzH85uChc1ENdbPvwhXSpWlW3D3BO3re1SdAYMA58WO5vBLyjK
 5+AHe0HIDllwjjJoT6Kj93oJUbCMavhVDs+g0D27dBsRk7icz+gIx/cr9+URSs3u5JGG
 9aL428MroM+Vjl0MjO9IZP1+IPI4gUbYw2pJYthpLLiVmZ+sFRDLl9G9a/LZJFAuSKhw /g== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2170.outbound.protection.outlook.com [104.47.73.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ce02h892w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Nov 2021 23:10:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3CiJCweJ/vjBgyCD/EgnxAjo5QQ1S8z1zjpB68KU7yGT68A6NX3jxsvN2ITJA7wzpCe0P0vTkGxL9j9UCItJhc28kFr/aYTd8bWlOeb/vnlgUmnbT6vrKkvGIeRdm21P1/eufD7Aa6nZ2FqgpbxrS6Dx7C1lGgWAJGAmK4SzD+BJ/bJMnpYVkWufUi98RFUyLX7kM6WV30zGuTc+7OFHP9nliaFV7y6IFfhHvzzV1WQ2FePOyM8qxZaGC9sgKWgtXNQmqxQLEPoWS/0XmVMhj2WcIL5HusSRgC5J+ZH6BmWA7zH9AnL5ywfxZY+JsEiOw7HVkQ0SHP0oUtxnGFilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izhdzZy7+SGAe0nzwTRRZcgXgBZ/8AMaK7k0+GcIkC8=;
 b=WO13Rxlx0/HuQs7cPGclc1O5JlWJxGG+ojxh6wQI3gsu4qal2HqWkjU+AOVRh1Wvh289JF9psi7QHnPNvJiZ6dxDK64v1A1SryGVM8Ndma83vaBDSWeA8HtF9HEtLaXcmGwEm+MPARAV6xFvcq3yKRykcrV33QIAyz8q19ZOlyMRyy+SwKXdvltjD4ZxRB++MbRDpbHlZ7rmNvgGSqQVT7ezkdpD/MKMtTFrKgJoMnOz4BvSGxKqHFHaiHWz9BGGkarcdqE2cvsc4KMZ/XlKfhyh3aDG/SKP2s2bihHNE6XMXz91obLpMjWdDz41/egm95YkM57Rter8PiWzkCMzcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5570.namprd11.prod.outlook.com (2603:10b6:303:138::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Fri, 19 Nov
 2021 07:10:12 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f%6]) with mapi id 15.20.4649.015; Fri, 19 Nov 2021
 07:10:12 +0000
Subject: Re: [meta-virtualization][m-c-s][PATCH] open-iscsi-user: remove typo spaces in SRC_URI
To: meta-virtualization@lists.yoctoproject.org
References: <16B661A3874E3006.9335@lists.yoctoproject.org>
From: "kai" <kai.kang@windriver.com>
Message-ID: <6e0222bd-7bf5-dbb3-d469-3f2356dcfaa2@windriver.com>
Date: Fri, 19 Nov 2021 15:10:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <16B661A3874E3006.9335@lists.yoctoproject.org>
X-ClientProxiedBy: HK0PR03CA0106.apcprd03.prod.outlook.com
 (2603:1096:203:b0::22) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
Received: from [128.224.162.156] (60.247.85.82) by HK0PR03CA0106.apcprd03.prod.outlook.com (2603:1096:203:b0::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend Transport; Fri, 19 Nov 2021 07:10:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2df84500-d9bc-4a05-64c8-08d9ab2ba0ed
X-MS-TrafficTypeDiagnostic: CO6PR11MB5570:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5570EF43451B67949601DABC959C9@CO6PR11MB5570.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:120;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GLbOzxpokbTWFCaiN3ke3fXsce9hn0CcrwXn1yOFI6gBU0zwQtLY6fBqCEvFFMZHhrYa25lvVa6a8sRNCsHibhYzEgOMyV/OLQlTbG2g6z7FeuwQEkyUulJeXbR6zmBD/UWeskyBrMfIL8EqPiwhxVGujCcGGAFqeu/Q8P0D90vftilOYQA+odq/wQv5/qBK9+u1/i462PItl8z2rxyFPzIZvQ26fVKRlVqRzjYp3tiofIManfHrlIdZXZRIYQP4ZPGh7eqVKibr2APGsCdIt0g/5rTkeyW3nnpNx6/hJVA8g0IuU+i5ahTfW93eTxsYXowXjmsDhK55arOhhXhFVRShF07QNl61Ljtx2M9tRKIVQ7HOowpx8IkOKAWlivCKQrOc7G77jRNSn/2sTziUXkrFiGqIQwAEVKd+5KFU0Oz1gxCFcr32YMDWH3OEtf8XdvwHkC8rfKH2yGsVXx71kwayvWRF0s9C3yBDedQZiNBD2UQmsl0UDg9CyyUunlvoY3B+mqhoEvImFvlzc3y1WnIKBA67sKiTpb0zAl5ZLBN+O+CAzMUtSV5Hp/phIat71ryHICbqaRX3O1Uj9zekoxqcl3hThSHeTSbnJwDVkUUuBP7Lao+IO4jMEk3dZb5uFfbwTBPsCEWh89v9PTPXxLWY72fLrQ32tTBrQRfv/6huxT62Ia7UrQcMEk2/SKRJt1mi58AZ1KSnIbgXOg3YkAf+tISHnmZbdBWBb9p/jNf1K18MDem3M82Mp47y7EhFvfMhnrNlHjPE68X6EEgqFdof75SVYLLd/e0FWElvIMQLqc+0RfUksAdutPK0EaPH7h6B1101iXvQ3QXIma84GTY7hFh2kRuoEfIFuVx02ifndm3xAcN1XFGvNbdownQQwovaJQ/j/+yIGmWQ6Zsid0qm2Ob7rOC3GUlZK9t4vnQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(36756003)(5660300002)(26005)(31686004)(66556008)(66476007)(86362001)(6706004)(83380400001)(166002)(316002)(956004)(66946007)(2616005)(6666004)(6486002)(33964004)(186003)(8936002)(52116002)(966005)(38100700002)(38350700002)(16576012)(508600001)(53546011)(8676002)(31696002)(2906002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YjBIRzlSWHZqQmV5dDFERWRkYWdvZm1DdGhjSnJOZkpRZDZ5aUROdmJTOEZL?=
 =?utf-8?B?cU56c3h6OHNoWVprZlFmSk5ndmxKcDlpaVFVYk5YZDhRUks5bnU0NlhkV3p5?=
 =?utf-8?B?VUR2azA5RFk5VFNKVkNSaUpGV242a0lXTkpSb2JWK3QzYUkvaTF2MDVyam1U?=
 =?utf-8?B?ZWlNaXNuWUtmZlE4ZDdLcDhtZ3ZydmpqS0pjbktRRzRETGJnR3RUalU5QWta?=
 =?utf-8?B?KzhlaHp5VndiUHU0QWNCNlBxR0NNVENjcmdGMUVBM2R2OGVlcnVRd0t5TExn?=
 =?utf-8?B?dUlSS3pOQ3F1bGxUMjVGWTcrWGhlT1NLNHI3Uk1EQTBmUHFWVG1TUkgvZmk4?=
 =?utf-8?B?RUtUZXRRbmFpSDZJdTlDSXQzRElQa3N5WkpuZFprM3g0N245QU9BenkyMnBL?=
 =?utf-8?B?QmJycFY2OXM1dnFldUJiMzQyTmxDNmY1eC94ZWF3K1dvb0xhdXcxREFiQThw?=
 =?utf-8?B?cjNXN3pNU2h4R1cxbE04NFNQbFZ1emRtV2J5SFBQWk9QZDRCMktXQlZnM0lO?=
 =?utf-8?B?M2JlUWZ6aVU0d1pPTWRmdW0zem0zWlZEY3NraVZjZ05xcG1HSytWRmNYbWxo?=
 =?utf-8?B?WU42Q2RPMUVJVjR6WldrUjhON0R4aEdGOFhwTlJPVWdvSGNsRzdacFBCZEgv?=
 =?utf-8?B?d0Jldi9uV3htVWM3OWxTZy9YeGhhbFYwY3VDQzVzSEMrbUJFQjh3SzRsR3Aw?=
 =?utf-8?B?QUk5dWgyUWpVRW9kc2ROVEhLbFBHajNiWm5RRG5Dc01sMm04dlhmaCtwS2JH?=
 =?utf-8?B?MG0rRFR1aFgyMmVHZmNkSnBFS3dhWXExSnlWZlh1WDJzKzFxOFdNTGNIb2Vz?=
 =?utf-8?B?TjVoWmZNV1BJQ0hKYmNuMlFPcGJqZHJXc2MxNzZJNnViVkZwNzVOaUllUGhp?=
 =?utf-8?B?bmVCbHhjVGdSbjhaaGtGZkgraVl0T0NFdGFKcmhnYndrL2pEenNRZmJnOWlQ?=
 =?utf-8?B?a3VsKzFFd2RSY1RrT0xhWW5nN0YzcnBSVFlrMVFyRnM2Y01EamluVit0blJM?=
 =?utf-8?B?NDFYNE5iKzlYSGpDNjhCZkt1MkVQNWg1cFhocGJEN0piNFJqeTNFYUx6Zll2?=
 =?utf-8?B?Mm5TMUNPS3FLM1I5ZE5tand6Q25WanNrdjkza3ZtdUxqN2pOYnJRaDB4eG96?=
 =?utf-8?B?Tm9wYUs3c0VzZlpmODJ5YUdTZmxOKzcyTS94Zzk3VnFUaHptT0hINHdzMlN3?=
 =?utf-8?B?eWc5cXlaQVZ5V3BBQ0U2c1BwWExUSTY4aDFDOHdDbDYyQjRFNDl1eWtDTlFG?=
 =?utf-8?B?aVRCQ0lWNzhIVldEYmRUL3UvVmE3a2daMkxWQkFsRFlvRGhQcjl3bHEyVlRB?=
 =?utf-8?B?UitoemxsN0Iyd1IxSFcwSWpVWVV1RVpmSWpocEhSYjMwSVR2a3JlQ2JMT1d1?=
 =?utf-8?B?ZExxdEJKN3ZBOGhTNVVSMkxZeUp1RFFOSDdrN01ITHlRTlh1b0NncjVPdkRr?=
 =?utf-8?B?Qy9wMEZqZlk5c2JCaWdQcVg0bHlZeDBYbjM3WnJEWkVTbHp3WHptQU9URmoy?=
 =?utf-8?B?NDgrK1hPNG1aajZkSm9BYjB4UHFQWXpLOHdtdlMxa3dYNGhoYjdIemEyYUwx?=
 =?utf-8?B?ZW9OYkxXTWZvQnRvOVNYOUp2NmJtd3FIVXdJZ0J4aXVXNWdCMGlYOHhUb2Ev?=
 =?utf-8?B?Sk1ZTWZ3TEhuWXg3U2VnamdTaVVGT2JtTU0rbk8ydExZOVF2K0o5bkVwaEsx?=
 =?utf-8?B?TjVBdTc3TElpNEUrcVZnYmg2bUlsSnpBczlENzBZc05GczUydnlpbVVSV3R6?=
 =?utf-8?B?cCtsRnIrS3RwOER5Z1dOU1ZyZUZGMW12V05nRWtIdlVOd2kvcnN6NWlrdDU3?=
 =?utf-8?B?YkZOSzVWM25mbWxOdGh1c0tUYjNyTEJzQ3d4WXF4a2ZmcFFUcEp0c1IvV3Ny?=
 =?utf-8?B?NkE3UXZBaXByQjhnRDhvbGp3SDhMdHRyM3pZN2ZzUUpVbStvWWtKT2VTQzFH?=
 =?utf-8?B?NFJGaUZnVEs5U1FRVkJVd0hmOS95dVl0cUFlak5mc0M4K1IwdkZ5cnVZMHFN?=
 =?utf-8?B?YVl3MUVLSmxsQm1EN2VGZjZGQU45T0cvT2g3eTBQMU1GZVdWQ0ZpRkxMY3Bu?=
 =?utf-8?B?eHpNd21vbVpCZ2tLZFVFMUdmYmQ1Ri93KzI0VHV3U2wwaVdRbVhHU1drUExh?=
 =?utf-8?B?aW9sK1lVZDRuMUVjaGhhWkhjREdmSWJ4eGtlR3hFd1ZEeHZBVkphSFlkR1ZZ?=
 =?utf-8?Q?ebFTr+8fTeHrXpnh8/aW2Q4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df84500-d9bc-4a05-64c8-08d9ab2ba0ed
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 07:10:12.5105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHaJakTB28ejOdyhjAbIeW4GYb1UAoLp4AMygUIrzxpjcjjegKhnka3D6fqQB3r8NrFrB9RXSvuNUxlVa+a6rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5570
X-Proofpoint-GUID: 11PlR4gm9Wx7QdzLkNczqiYh62m3B8R3
X-Proofpoint-ORIG-GUID: 11PlR4gm9Wx7QdzLkNczqiYh62m3B8R3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_07,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=875 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190038
Content-Type: multipart/alternative;
 boundary="------------3219BA4C3152435A543071F5"
Content-Language: en-US

--------------3219BA4C3152435A543071F5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/21 11:53 AM, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> There are typo spaces in SRC_URI which are introduced when add
> ';branch=master'. Remove them.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   .../recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
> index d4c489cf..fe802b72 100644
> --- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   DEPENDS = "kmod openssl util-linux open-isns"
>   DEPENDS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
>   
> -SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https  ;branch=master \
> +SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https;branch=master \
>              file://0001-fix-build-error-of-cross-build.patch \
>              "
>   

Ping.


>
> 
>

-- 
Kai Kang
Wind River Linux


--------------3219BA4C3152435A543071F5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/11/21 11:53 AM, kai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16B661A3874E3006.9335@lists.yoctoproject.org">
      <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

There are typo spaces in SRC_URI which are introduced when add
';branch=master'. Remove them.

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 .../recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
index d4c489cf..fe802b72 100644
--- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
+++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263">&quot;file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263&quot;</a>
 DEPENDS = &quot;kmod openssl util-linux open-isns&quot;
 DEPENDS:append = &quot; ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}&quot;
 
-SRC_URI = &quot;git://github.com/open-iscsi/open-iscsi.git;protocol=https  ;branch=master \
+SRC_URI = &quot;git://github.com/open-iscsi/open-iscsi.git;protocol=https;branch=master \
            <a class="moz-txt-link-freetext" href="file://0001-fix-build-error-of-cross-build.patch">file://0001-fix-build-error-of-cross-build.patch</a> \
            &quot;
 </pre>
    </blockquote>
    <p>Ping.</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:16B661A3874E3006.9335@lists.yoctoproject.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------3219BA4C3152435A543071F5--
