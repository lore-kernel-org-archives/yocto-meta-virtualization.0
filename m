Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC6FC761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 15:20:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.28162.1680189595712815931
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 08:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=q4vJITtF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34532ef2cb=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32UDumjE019070
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Mar 2023 08:19:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=FsHQDn4ifkXfVCQhE1ERvTMt/5Blulaffl/Xy49nOSo=;
 b=q4vJITtFBeAZ0X5hQDIv6XfWzmI77xB4YCExvhT7Un3y3bDgDM6jnPcXcob7ycwtajAM
 oLyM1ovtZA28LI7psqQrFnjOoYiJdcjPYuXOUW8zct5FOTCS4AhbRPJStbIhASHfGw2+
 kLk/luO+uE/4ZnSsm/FLq7YFm4JiSmOp/enThn7FY8MQYOlGCWoQ0G4Dynqjr30m4LhD
 jc1DTkBa84wK6eGtC3OqVSRsANiVp6owkxNgum88bKI+tGep23lJcR0zc/2gdiQ4NWef
 1ElQ/djMNfp8m8kfNneKMl4HEsDyQ2U3QSu6PHcsD64cYtj3Sl/zIvB47ml0evX5J4q8 zw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phv85x9q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Mar 2023 08:19:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFs2PM1v/eaxqOhX09Uumbk8YXawKZALrE68I+hEVyFt5i0MqjKQHoHd7B7sYy1AyZRuQ1oiSnG6zLMg7OjF5tWcUeq4lhifDWTqPegQhdR4+mJT74/F/zuP0brdTj3bTp2bOjAv+jjrlYLzQyqQI03UEHe2uqrhytczVzRiY+fV7Yi31CrNxTzgyK3zqZ8fDS+Jq/EyRc203BNAQcuQBNmSsCWylb1WUHo5ldw6Uvx8EhY0V80marZ8kzrJJJ2gdJTYjccMoE3j9RwkPsVdF0LdAICby8y6avYjVPkEWIuQYBUQr6MHnGjn7UvKJUPvEntsXjch17Fg/x85RFiaJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsHQDn4ifkXfVCQhE1ERvTMt/5Blulaffl/Xy49nOSo=;
 b=T6VN8l8X4GcGM7E/shZAV1d4IkPUtBcnP3wqUneMiajGwDa5pnSGzKxcNJIXtJ/zDHio163ftQXq2Gowlh3AyPgAw8j9NqkR4nO8ELUvyD+wehyol55VBghwz2W/aauDiyXl5/TIT7HLk3H+0Kgq2ZTxJj6of7tNyzm6/uzIcBYhFuQ+8eeEbjrerv65eGJAYYpMF6KxairU/0G/7gHDw68azPE70tx3YKFUyxuwjZfqKmGjwDl+vgiue/33l9YdYz5Uet7EUBJX8bDtjoXcfwMrYOK1DlIu1B8e+vV70c71VHDSbJBMFaAmSEcALHFAI/1uzK39S7xxsXASY+juKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 CY5PR11MB6510.namprd11.prod.outlook.com (2603:10b6:930:42::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.41; Thu, 30 Mar 2023 15:19:52 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4f46:b639:f638:d5f7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4f46:b639:f638:d5f7%5]) with mapi id 15.20.6222.035; Thu, 30 Mar 2023
 15:19:52 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH v2] kubernetes: update to v1.23.17
Date: Thu, 30 Mar 2023 11:19:41 -0400
Message-Id: <20230330151941.932323-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0019.namprd15.prod.outlook.com
 (2603:10b6:207:17::32) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|CY5PR11MB6510:EE_
X-MS-Office365-Filtering-Correlation-Id: 49d991d7-a4e1-4611-182a-08db313235e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k699x6F9cnr0zQVVXs5HRrihAIH8SHIJeeGq/5kqycp3UdowzlvkdnC7zFWGzC0p8P/c1o9fA26G+FbR4ytSsj/EzZWR6SI4aTZlCo0d0lkuiER/6yvweM9jlOTXvXvjVzmeJaS5Shy6/mHTFx/lAiKk0lyvfycSx94x75P0LkXGZ95NxCga8YPGdHsmU4rL8slGC1lFjTyKxM/RNj0aXHaHPNMs4osdr2WT3/7beYYQfJiNXf5sAvY3fU7s5/oCM49VTGXr+FU0/EeUQMWqqgFB9OD453mHSxry8I65ANavgcnwv7w5lRvwX38xW4OoamaLBpQuQVbGxaDoQgcC2xOgyOWoMhXRLcEgUMqBvatc+rylXfLUXg2bt48d2/GLxUpZVU5+vNtWdUonxeFxWdput6ziTPaGsv/OseGBAK28U4srW7zNniUiqyrU4bImrv1XzIz0bdm+SBFLVE/BqS7HVvXTq4YyUkuhW3RsrCnOJPVdZNxAHPuckyReaxC9dOK6OYW0s3E3aiCWj+wkvFq+kDJLKSNvwTT1LVmsV4JnhKLkbtjNc66vXNT7tBAZEEu56hPt+Ig2c7KzNLDyOe2VholGk18TGrtHQvpvzCdUejrDv+q8zYAS73xYchRUVHp/tLvkdc5XZFPlcHqv6DXwJJwAEuSQy7v0BQVkKkGtWDhjSisSkb0h8Io4+Umy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39850400004)(136003)(396003)(376002)(451199021)(52116002)(38100700002)(186003)(83380400001)(6506007)(36756003)(1076003)(6512007)(6666004)(26005)(86362001)(6486002)(84970400001)(41300700001)(2906002)(15650500001)(316002)(8936002)(38350700002)(44832011)(8676002)(478600001)(6916009)(66476007)(2616005)(66946007)(5660300002)(66556008)(30864003)(120070200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YRxRXgxBWBCxj2Wei9yoi4BTCU3/ANMOBsT0BZGlLSs9AxeracioeQdIBF5P?=
 =?us-ascii?Q?96hZyG2cruy266uYy5hpHyUk1LI/JjKMwTxvFpwz0GDxXpfMUqix47czsLIc?=
 =?us-ascii?Q?fNscm6SN3/73p1SHL4Wf0QtDucPae3xWm6SCqRFFpZZv9az4uUTqsp4EBo0y?=
 =?us-ascii?Q?9Aw4IxLFuzufXrzsDxDEsq0WnE97KmwnYRSOVB8G14JNkMLXUxlEg5Lcea3X?=
 =?us-ascii?Q?jgNIhkVz9JtnTx0GVa8r1JsOAHyHkuXJv2XwTG+TKLvm+9lrKaaF+MEM/+nc?=
 =?us-ascii?Q?QRsqibC4gH0GDwAfaxMzcLwfxG/6dYqnwFS6SuzrhTZrRIvygiwPGD7B4T8g?=
 =?us-ascii?Q?s9Bfaz4eFYuPkbR4DwxXIisWYQWs7XlaKWRwD8TRx4VVZvtpCDjIQsVbt6Vo?=
 =?us-ascii?Q?7+NgjEmRiMZje7V/tzV1c6V7ECn+HI0cSRkfiVOwfH2O3v0svG1FJ0msm6wp?=
 =?us-ascii?Q?Alh9pcTxQnz+SfIoOPn/cxd4d/eW9p7tg8+DW8xKtc+Q4qAcgjPsct8/2tvp?=
 =?us-ascii?Q?cHgdHhHVElA+h1z46qXVxkuZmOyHK5hNJQlsjFwmdwxk+9DfGYlqjacJZgUd?=
 =?us-ascii?Q?Pxh7LX9MzkSOGeOeAzTx+M5KHjkN3Z/GrfcJQlhZIRk41kD7F0IVMZj82KKF?=
 =?us-ascii?Q?KHaI2AE5TTfVYMChobtZ5noomkx4X+obAOX/U7jbUK+uHGnSI30nfdZzW8pJ?=
 =?us-ascii?Q?SIZQzRCLG3KOXBMh4xsTbzUrcsm/8CkWVcHE0kiEl1rUKihtbXQXN6RJdOdZ?=
 =?us-ascii?Q?O9fFkhvdOvrYQjcngcnwwlfaA+eeO3XX5m2+g5JrLlFEkzaE8rIT7yp+n5YG?=
 =?us-ascii?Q?MGo4F649RcybkSTa+MvTxftutW009K6+Zv0fk2yyt707SguawtRueMA9aO0k?=
 =?us-ascii?Q?lA4+9QA8G7jxlIVwqn6luWhO+TMWtGoi3BvZm1gqCJPL5wVEaA0GBv8vggBv?=
 =?us-ascii?Q?IXFHguw5zYA3dqzzA6GX6z7Csj8MiD8AIN9azt17jAq0wTW99loGwyBs75KU?=
 =?us-ascii?Q?DWxYS2Qb4IpBigbsdy5Ya/d9us1W++0kCzgqKhOKPH2UZNa8S5Ptaum2b7bA?=
 =?us-ascii?Q?JAVTghUYlZn00s9mg7/8QLuByPXBVj9LRVzR54n08WgwcZ8FKiZX2hcWqt5Z?=
 =?us-ascii?Q?OOHcjRCU8QJUwK07o1kFyRKKlxNCh1N54/vrCylqJxy8JE7+MkekyVjjqsFr?=
 =?us-ascii?Q?qserGkEO8f0Ib9BgYhp67GivNGtPyiKSEDxPUK1kS4kPsoQ7pXtc4xHCSi3N?=
 =?us-ascii?Q?7EzWoy+VqhdaRaK/B+h2aWvM0YlzXxrl5ctsfpUrygim+A2bSGJsVKVuYHxZ?=
 =?us-ascii?Q?b9EWHLLvw8ANP9Grm2JEgyKasJLfZD7cf0QLK7rC8GVzJVPhzEz6T/sXwnBi?=
 =?us-ascii?Q?Wr8UTVQ7ah1FsbuIYVwBkuQZISfb6mPvm2d+HPMlGTHZy33fr+mmiJBbdJnw?=
 =?us-ascii?Q?UsJkVGe7qPcFofciC+ZYmcy9rCIpcwn9hoLJf9m801u9BwzSTPpuI0aWePp8?=
 =?us-ascii?Q?eTvsWUvvs7nn/FAXhIMVG2LEknxWazTCL4/syZ39QZo6z/JQjSWACXodG5Mm?=
 =?us-ascii?Q?VAHkxjbk8KvIw3haI0pM7Pk8YdYQyYmqNkM/6WDQlv9MrTsd+Ko5tVF0FTLO?=
 =?us-ascii?Q?6g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d991d7-a4e1-4611-182a-08db313235e5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 15:19:52.7145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgRyaM/26Il94gXbYJULTr05rIDvrgm56+/5yGLEA2EeXZS++UqLqBStr0Y15znNxqGOmPc85+u9aII+Q+0q6gdwJ3I4N0RD0E+0DUNmTEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6510
X-Proofpoint-GUID: HWDfP2XALcAFFhrYeukYnGlYBjwwCZ0I
X-Proofpoint-ORIG-GUID: HWDfP2XALcAFFhrYeukYnGlYBjwwCZ0I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_09,2023-03-30_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303300121
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Mar 2023 15:20:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7972

Bumping kubernetes to version 1.23.17, which comprises of the following commits:
    $ git log --no-merges --oneline fbcfa330..953be892
    953be892721 (tag: v1.23.17) Release commit for Kubernetes v1.23.17
    6e8e51a6e9b releng: Update images, dependencies and version to Go 1.19.6
    717b7220f1e Update golang.org/x/net to v0.7.0
    7ce32a84313 Pin golang.org/x/net to v0.4.0
    39644edd8c5 add scale test for probes
    ce58b0469ad use custom dialer for http probes
    1045dff13cf use custom dialer for tcp probes
    2b17ed30b0e add custom dialer optimized for probes
    817b9af22eb Update CHANGELOG/CHANGELOG-1.23.md for v1.23.16
    cf0cb75908f (tag: v1.23.17-rc.0) Release commit for Kubernetes v1.23.17-rc.0
    60e5135f758 (tag: v1.23.16) Release commit for Kubernetes v1.23.16
    dd61fe9127c Fix issue that Audit Server could not correctly encode DeleteOption
    da38bf46791 egress_selector: prevent goroutines leak on connect() step.
    9f5af83b8fa Always dial using a context
    f99efc598c3 tls.Dial() validates hostname, no need to do that manually
    c4b42ed0f7d Do not include scheduler name in the preemption event message
    9ddf8802962 Do not leak cross namespace pod metadata in preemption events
    4dd99967bd7 pkg/controller/job: re-honor exponential backoff
    53ae12b797c releng: Update images, dependencies and version to Go 1.19.5
    42cc636b84f Bump Konnectivity to v0.0.35
    2dae3b969ff Improve vendor verification works for each staging repo
    3e3120d5ed3 Licensing: skip modules with fewer subdirs than mods
    9963f00a9cc Add .go-version file containing build go version
    203d8ac8384 Generate and format files
    e55e20ed50a delete hardcode go version in golangci-lint config
    ca22f110d65 update golangci-lint for go 1.19
    c54219fc231 Update go.mod to go1.19
    fd427d821dd Update to go1.19
    3be293676bd Adjust for os/exec changes in 1.19
    3cab72ac5a7 fix patch_test for gofmt issue
    249e05a172b Fix quotes that trip up gofmt
    ab0f90f3d27 Update golangci-lint to 1.46.2 and fix errors
    7e2e4821dd4 Match go1.17 defaults for SHA-1 and GC
    0e2e6b9071a fix e2e coverage package for go 1.18
    6179de8dbb0 Regenerate vendor
    7c6027a4cd1 Update go.mod files to go1.18, update license vendor script
    84fde398c4d Ignore unstructured log warnings
    4da1f79f991 enhance and fix log calls
    c95a8a17eb4 hack: integrate logcheck into golangci-lint
    944176729a8 Fix verify: generated-stable-metrics wrt go 1.18
    3aaa70a7c53 Regen mocks using go 1.18
    42931a01097 TestWatchRestartsIfTimeoutNotReached: fix
    0a782b495fd update golangci-lint to 1.45.0
    1eeda2b1c27 Update to golang.org/x/... matching release-1.24
    c94870e7a89 Fix SPDY proxy authentication with special chars
    a346b14331f Improve error message when proxy connection fails
    981b158aaa9 image pull event include duration with waiting
    97953921640 kubelet: make the image pull time more accurate in event
    bf234d8f0dc Update CHANGELOG/CHANGELOG-1.23.md for v1.23.15
    5c4538e0ac3 (tag: v1.23.16-rc.0) Release commit for Kubernetes v1.23.16-rc.0
    b84cb8ab293 (tag: v1.23.15) Release commit for Kubernetes v1.23.15
    ae80fed2259 change k8s.gcr.io/pause to registry.k8s.io/pause
    3ace674c79b Reduce load of Job integration test
    1427350c045 Fix endpoint reconciler failing to delete masterlease
    974e9492a7e use etcd 3.5.6-0 after promotion
    ec2718f11d6 changelog: CVE-2022-3294 and CVE-2022-3162 were fixed in v1.23.14
    4eee325a5a7 Limit request retrying to []byte request bodies
    16c6800134b Merge pull request #113133 from sxllwx:automated-cherry-pick-of-#113133-upstream-release-1.25
    c27b4b9db8c Add CVE-2021-25749 to CHANGELOG-1.23.md
    25bc84525e3 Add CVE-2022-3294 to CHANGELOG-1.23.md
    64548944d67 e2e: use custom timeouts in GetSnapshotContentFromSnapshot()
    c73e13d1309 test/e2e/storage: replace hardcoded value with custom timeout in cleanup routine
    65b9cb99755 Update CHANGELOG/CHANGELOG-1.23.md for v1.23.14
    92d36466905 (tag: v1.23.15-rc.0) Release commit for Kubernetes v1.23.15-rc.0
    3321ffc07d2 (tag: v1.23.14) Release commit for Kubernetes v1.23.14
    073dca06ae0 Fix a conflict
    65beed7952d StatefulSet: Cleanup the complex defer function updating the status
    d737324312e Be sure to update the status of StatefulSet even if the new replica creation fails
    bb7c395dd94 fix node address validation
    073c05d169d Validate etcd paths
    390fc213595 Use CheckAndMarkAsUncertainViaReconstruction for uncertain volumes
    23184ed5f68 Remove volume from found during reconstruction if mounted
    ac6efc17b96 Add unit test for verifying if processReconstructedVolumes works as expected
    386b026d0b1 Address review comments
    a44c6b9e317 Fix code to process volumes which were skipped during reconstruction
    75b8b1ebfd5 Keep track of each pod that uses a volume during reconstruction
    c5a565c69f8 kubelet: fix pod log line corruption when using timestamps and long lines
    c33ae96c4b7 hack/scripts: use registry.k8s.io
    304eb41e106 kubeadm: mutate ClusterConfiguration.imageRepository to "registry.k8s.io"
    f1e3eabb139 add GetAllocatableCPUs test in cpumanager
    67309f5422d fix GetAllocatableCPUs in cpumanager
    a98d0db2af2 kubeadm: use registry.k8s.io instead of k8s.gcr.io
    132565c82e2 do not return err when PodSandbox not exist
    589223b64a8 e2e: restore volume lifecycle checks for csi-hostpath driver
    4edf6775ef8 kubelet: fix volume reconstruction for CSI ephemeral volumes
    6e3601cc720 NodeLifecycleController: Remove race condition
    7bc8104ff65 kube-proxy wait for cluster cidr skip delete events
    6cca0631918 kube-proxy handle node PodCIDR changs
    f9e15b3ac3f etcd: Updated to v3.5.5
    c2e5631742f Bump konnectivity network proxy to v0.0.33. Includes a couple bug fixes for better handling of dial failures. [Agent & Server](https://github.com/kubernetes-sigs/apiserver-network-proxy/commits/v0.0.33) include numerous other fixes.
    b6e86eb30ab Merge pull request #109241 from ravisantoshgudimetla/sts-ar-optional
    700be498954 service update event should be triggered when appProtocol in port is changed.
    d053be81df1 Update CHANGELOG/CHANGELOG-1.23.md for v1.23.13
    56453b2f0ae (tag: v1.23.14-rc.0) Release commit for Kubernetes v1.23.14-rc.0
    592eca05be2 (tag: v1.23.13) Release commit for Kubernetes v1.23.13
    bab054e4568 filter out terminated containers in cadvisor_stats_provider
    4c6c616069d Make mount ref search more robust
    9ed9ccfd275 CHANGELOG-1.23: Add missing changes for 1.23.12
    760a96b2dbc Update CHANGELOG/CHANGELOG-1.23.md for v1.23.12
    51c6ad6b97b Fix list estimator for lists that are executed as gets
    4634d2f91e0 (tag: v1.23.13-rc.0) Release commit for Kubernetes v1.23.13-rc.0
    c6939792865 (tag: v1.23.12) Release commit for Kubernetes v1.23.12
    95d3fbc36dc kubeadm: allow RSA and ECDSA format keys in preflight check
    9bebb528e09 Limit redirect proxy handling to redirected responses
    59571b2f136 Make sure auto-mounted subpath mount source is already mounted
    ae6a6dc2f8e Call SetupDevice only if Volume is not globally Mounted
    860df6bfc18 Fixes kubelet log compression on Windows
    ad16e6bb8c0 Update CHANGELOG/CHANGELOG-1.23.md for v1.23.11
    222372b27c7 (tag: v1.23.12-rc.0) Release commit for Kubernetes v1.23.12-rc.0
    dc2898b20c6 (tag: v1.23.11) Release commit for Kubernetes v1.23.11
    301ea5b8cdb Reduce default gzip compression level from 4 to 1 in apiserver
    0e4fc8b0e6c Add an option for aggregator
    b69bbf36201 exec auth: support TLS config caching
    479f049df90 Fix unit test
    62e1ea58c44 Fix problem in updating VolumeAttached in node status
    94b41ed31af Call queueSet::boundNextDispatchLocked enough
    bc157c71601 Add etcd initialization in openapi tests
    087362857b9 Marshal MicroTime to json and proto at the same precision
    f58d3f3fe58 Windows: ensure runAsNonRoot does case-insensitive comparison on user name
    da7c41caa91 Tolerate sub-microsecond eventTime changes on update
    446f23cea45 Improve kubectl display of invalid errors
    17335199bab fix unmatch reason when updating pod status
    240590c3eaa fix nestedPendingOperations mount and umount parallel bug
    091f4f00395 client-go: make retry in Request thread safe
    7adf53240c7 Skip "instance not found" error for LB backend address pools
    5f4953560cb Remove AttachID matching from Detach
    93dedd539c4 update structured-merge-diff to 4.2.3
    be5dd1bdc79 regression test for exponential recursion bug on CRDs
    7ce504b9281 Update CHANGELOG/CHANGELOG-1.23.md for v1.23.10
    b445d7947a8 (tag: v1.23.11-rc.0) Release commit for Kubernetes v1.23.11-rc.0
    7e54d50d301 (tag: v1.23.10) Release commit for Kubernetes v1.23.10
    431ee1484e2 fix a memory leak problem when calling DryRunPreemption
    23e9d632ad6 Fix deleting UIDs tracking expectations
    24b8252b105 Fix JobTrackingWithFinalizers when a pod succeeds after the job fails
    e1ab1debdba hardens integration job tests
    fe8b09dde6a Copy etcd client debug level logic from upstream
    61432c1fa21 Give etcd client logger a name
    c7399df0a5f Share a single etcd3 client logger across all clients
    9a60b0c5f4b Disable the etcd3 client logger
    c078600b61d Update Go to 1.17.13
    a86b61cf3c9 Update Go to 1.17.12
    5f436c0fb35 fix a possible panic because of taking the address of nil
    e3a4a91c768 Update naming for a const
    f00326d1b46 Add rate limiting when calling STS assume role API
    f008acd481e Ensure the dir of --audit-log-path exists
    4bc41ee70ca Fix kubelet panic when accessing metrics/resource endpoint
    b26a7082ad2 Update CHANGELOG/CHANGELOG-1.23.md for v1.23.9
    90ecbd8cf26 (tag: v1.23.10-rc.0) Release commit for Kubernetes v1.23.10-rc.0
    c1de2d70269 (tag: v1.23.9) Release commit for Kubernetes v1.23.9
    579ca64e444 Fixing logic for kubelet permissions check on windows
    71a4c69a211 Do not skip job requeue in conflict error
    bf4cb96e0f0 kubeadm: fix the bug that configurable KubernetesVersion not respected during kubeadm join
    c67e53398b7 Bump cAdvisor to v0.43.1
    3cc22b53887 Fix: filter out unsatisfied nodes when calling AddPod in PodTopologySpread
    7d0a546b413 Fixing issue in generatePodSandboxWindowsConfig for hostProcess containers by where pod sandbox won't have HostProcess bit set if pod does not have a security context but containers specify HostProcess.
    3d5c2341271 Add retry logic for Unix Domain sockets on Windows
    602dd1dbcfd kubeadm: fix the bug that configurable KubernetesVersion not respected during kubeadm join
    3d1baf7ff2f GIT-110239: fix activeDeadlineSeconds enforcement bug
    2eed3eb9177 fix: --chunk-size with selector returns missing result
    3964e236193 Fixed winkernel proxy failing to query v1 endpoints created by dockershim CNIs
    c535496be2c Winkernel proxier cache HNS data to improve syncProxyRules performance
    938a3203c60 Update CHANGELOG/CHANGELOG-1.23.md for v1.23.8
    05a1dd747bd (tag: v1.23.9-rc.0) Release commit for Kubernetes v1.23.9-rc.0
    a12b886b1da (tag: v1.23.8) Release commit for Kubernetes v1.23.8
    a736f42c3ae apiserver: printers should use int64
    99c3de2562d Revert "Automated cherry pick of #109124: Winkernel proxier cache HNS data to improve syncProxyRules"
    930092e7153 Add test to check for _v2
    e6cce430f9c Prune defaults for CRD serving
    e38a625e116 add missing error handling steps
    c14aa800f45 add missing error handling steps
    d5eeb104cf2 fix image pulling failure when IMDS is unavailalbe in kubelet startup
    772494dc74e test: update graceful node shutdown e2e with watch
    6041228d192 move the ignore logic higher up to the reconciler
    0e1588c7584 Ignore EndpointSlices that are already marked for deletion
    96ddfd61755 kubelet: Mark ready condition as false explicitly for terminal pods
    57c626299a8 agnhost: bump version 2.39
    c796630e8de Update Go to 1.17.11
    1f58ea0af02 add service e2e tests
    6bdb7a15205 kubelet: add e2e test to verify probe readiness
    7061d1f4660 kubelet: only shutdown probes for pods that are terminated
    5899d561f34 kubelet: Pod probes should be handled by pod worker
    bb09c564009 Enable resize feature
    a36ff8366b7 Reject proxy requests to 0.0.0.0 as well
    082620e9cb9 ipvs: fix prevent concurrent map read and map write for 1.23
    3da57319709 cpu manager policy set to none, no one remove container id from container map, lead memory leak
    b24dfdee1e0 fix audit union loop variables in closures
    67219f30455 Updating e2e test to check EndpointSlices and Endpoints as well
    d5a61580c68 e2e: services with evicted pods doesn't have endpoints
    5adb67a7eb3 e2e test for evicted pods
    e0fdecef811 endpoints controller: don't consider terminal endpoints
    4e9638063f5 endpointslices: terminal pods doesn't receive enpoints
    51ef8e3917d add pod util to verify pod is terminal
    1eef73e88e4 Update CHANGELOG/CHANGELOG-1.23.md for v1.23.7
    782029346ae (tag: v1.23.8-rc.0) Release commit for Kubernetes v1.23.8-rc.0
    42c05a54746 (tag: v1.23.7) Release commit for Kubernetes v1.23.7
    e90d92fa5b2 Add test for checking ephemeral volume expansion
    d6260cf1df9 Fix resizing of ephemeral volumes
    51f1da831de Fix requests scope classification
    87e74167efe Update Go to 1.17.10
    830186c95e8 authn: fix cache mutation by AuthenticatedGroupAdder
    131a5090f34 GCE: skip updating and deleting external loadbalancers if service is managed outside of service controller
    424dde318ce untangle fix with healthCheck feature
    6bf9857f1f0 Winkernel proxier cache HNS data to improve syncProxyRules performance
    9b4dee89278 Wait for cache to sync in job's TestWatchOrphanPods
    8f4ff396eb3 fix: exclude non-ready nodes and deleted nodes from azure load balancers
    fb70875f1a9 Fix OpenAPI loading error caused by empty APIService
    88bde765611 Test Foreground deletion in job integration
    11e6ec43964 Fix removing finalizer from finished jobs
    b6804313363 Don't mark job as failed until expectations are satisfied
    d0b5adb539d Integration test for backoff limit and finalizers
    43ec5bfa40c tests: Updates the should delete a collection of pods test
    fe0da319ad4 component-base: replace url in rest client metrics
    21b9e9902e7 fix broken find command
    70882c44773 Allow KUBE_TEST_REPO_LIST to be a remote url as well
    6d010706ea4 Disable JobTrackingWithFinalizers due to unresolved bug
    fa7ac2ece9a Update CHANGELOG/CHANGELOG-1.23.md for v1.23.6
    bb18301a5c8 (tag: v1.23.7-rc.0) Release commit for Kubernetes v1.23.7-rc.0
    ad3338546da (tag: v1.23.6) Release commit for Kubernetes v1.23.6
    3df0ce04724 Update Go to 1.17.9
    4d38e6e99c9 Correct event registration for multiple scheduler plugins.
    8e1fb52b49b kubelet: rename closeAllConns to onHeartbeatFailure
    359ad38d11d kubelet apiserver: be gentle closing connections on heartbeat failures
    327e99d3393 Avoid updating Services with stale specs Fix the bug that service specs in servicesToUpdate may have been updated by clients.
    727aa48b989 Fix: abort nominating a pod that was already scheduled to a node
    f0753a49862 fix: race detected in TestErrConnKilled
    51c860863f7 Replace hardcoded kubectl with kubectl.Name()
    04d413b92ab kubectl: fix hard-coded value in zsh completion
    90539b64efd Fix the overestimated cost of deletaged API requests in P&F
    813751ef7a2 omit enums from static openapi snapshots used to generate clients
    4d3efbab01d Drop enum tag from certificate request condition
    814ae980477 Addresses the issue which caused #109115
    6ba5a0bc383 Add test for indexer with multiple values
    9342552112d Reduce number of pods in Job+GC tests
    e637f54d914 kubeadm: add etcd flag for member data consistency
    897eb36396d Adjust validation checks to pass for both client-side and
    server-side validation
    f75e1b071d4 Remove finalizer when orphaned
    56d9c45895c Fix: Clean job tracking finalizer from orphan pods
    3b84efd15de Add test for Background delete propagation
    8077e58bff1 Add integration test for orphan pods when there is GC
    2faf6317075 Fix a bug that out-of-tree plugin is misplaced when using scheduler v1beta3 config
    cf4ede44fe7 ipvs: remove port opener
    70166f26b89 iptables: remove port opener
    8e44552a6f9 kubelet: If the container status is created, we are waiting
    02f2986b850 Skip updating Endpoints and EndpointSlice if no relevant fields change
    f628706339c client-go: update generated
    3de44bd759a default kubernetes agent for generated clients
    8d9001df847 generated: make update
    f4cd617b74f polish comments of non-enum values.
    2538b2ef438 unmark non-validated types as enums.
    33a72b11fe8 azure_file: try to get secret namespace from ClaimRef
    451afa701bf azure_file: add namespace tests for InTree to CSI conversion

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 170a938..f475bd7 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -5,8 +5,8 @@ applications across multiple hosts, providing basic mechanisms for deployment, \
 maintenance, and scaling of applications. \
 "
 
-PV = "v1.23.6+git${SRCREV_kubernetes}"
-SRCREV_kubernetes = "fbcfa33018159c033aee77b0d5456df6771aa9b5"
+PV = "v1.23.17+git${SRCREV_kubernetes}"
+SRCREV_kubernetes = "953be8927218ec8067e1af2641e540238ffd7576"
 SRCREV_kubernetes-release = "7c1aa83dac555de6f05500911467b70aca4949f0"
 PE = "1"
 
-- 
2.40.0


