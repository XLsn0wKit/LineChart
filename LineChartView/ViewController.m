//
//  ViewController.m
//  LineChartView
//
//  Created by ginlong on 2018/1/30.
//  Copyright © 2018年 ginlong. All rights reserved.
//

#import "ViewController.h"
#import <Charts/Charts-Swift.h>
//#import "LineChartView-Swift.h"///调用swift

@interface ViewController () <ChartViewDelegate>

@property (nonatomic, strong) LineChartView *lineChartView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _lineChartView = [[LineChartView alloc] initWithFrame:(CGRectMake(0, 100, 375, 600))];
    [self.view addSubview:_lineChartView];
    _lineChartView.delegate = self;
    
    _lineChartView.chartDescription.enabled = NO;
    
    _lineChartView.dragEnabled = YES;
    [_lineChartView setScaleEnabled:YES];
    _lineChartView.drawGridBackgroundEnabled = NO;
    _lineChartView.pinchZoomEnabled = YES;
    
    _lineChartView.backgroundColor = [UIColor whiteColor];
    
//    BalloonMarker *marker = [[BalloonMarker alloc]
//                             initWithColor: [UIColor whiteColor]
//                             font: [UIFont systemFontOfSize:12.0]
//                             textColor: UIColor.redColor
//                             insets: UIEdgeInsetsMake(8.0, 8.0, 20.0, 8.0)];
//    marker.chartView = _lineChartView;
//    marker.minimumSize = CGSizeMake(80.f, 40.f);
//    _lineChartView.marker = marker;
    
    ChartLegend *l = _lineChartView.legend;
    l.form = ChartLegendFormSquare;
    l.font = [UIFont boldSystemFontOfSize:12];
    l.textColor = UIColor.blackColor;
    l.horizontalAlignment = ChartLegendHorizontalAlignmentLeft;
    l.verticalAlignment = ChartLegendVerticalAlignmentBottom;
    l.orientation = ChartLegendOrientationHorizontal;
    l.drawInside = NO;
    
    
    ChartXAxis *xAxis = _lineChartView.xAxis;
    xAxis.labelFont = [UIFont systemFontOfSize:11.f];
    xAxis.labelTextColor = UIColor.whiteColor;
    xAxis.drawGridLinesEnabled = NO;
    xAxis.drawAxisLineEnabled = NO;
    xAxis.gridColor = [UIColor clearColor];
    xAxis.axisLineColor = [UIColor clearColor];
    
    ChartYAxis *leftAxis = _lineChartView.leftAxis;
    leftAxis.labelTextColor = [UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f];
    leftAxis.axisMaximum = 200.0;
    leftAxis.axisMinimum = -200.0;
    leftAxis.drawGridLinesEnabled = YES;
    leftAxis.drawZeroLineEnabled = NO;
    leftAxis.granularityEnabled = YES;
    leftAxis.gridColor = [UIColor clearColor];
    
    ChartYAxis *rightAxis = _lineChartView.rightAxis;
    rightAxis.labelTextColor = UIColor.redColor;
    rightAxis.axisMaximum = 900.0;
    rightAxis.axisMinimum = 0;
    rightAxis.drawGridLinesEnabled = NO;
    rightAxis.granularityEnabled = NO;
    leftAxis.gridColor = [UIColor clearColor];

    [_lineChartView animateWithXAxisDuration:2.5];
    [self updateChartData];
}

- (void)updateChartData{
    [self setDataCount:20 + 1 range:60];
}

- (void)setDataCount:(int)count range:(double)range {
    NSMutableArray *yVals1 = [[NSMutableArray alloc] init];
    NSMutableArray *yVals2 = [[NSMutableArray alloc] init];
    NSMutableArray *yVals3 = [[NSMutableArray alloc] init];
    NSMutableArray *yVals4 = [[NSMutableArray alloc] init];
    
    NSMutableArray *yVals5 = [[NSMutableArray alloc] init];
    NSMutableArray *yVals6 = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++) {
        double mult = 120;
        double val = (double) (arc4random_uniform(mult)) - 50;
        [yVals1 addObject:[[ChartDataEntry alloc] initWithX:i y:val]];
    }
    
    for (int i = 0; i < count - 1; i++) {
        double mult = 80;
        double val = (double) (arc4random_uniform(mult)) - 20;
        [yVals2 addObject:[[ChartDataEntry alloc] initWithX:i y:val]];
    }
    
    for (int i = 0; i < count; i++) {
        double mult = 133;
        double val = (double) (arc4random_uniform(mult)) - 66;
        [yVals3 addObject:[[ChartDataEntry alloc] initWithX:i y:val]];
    }
    
    for (int i = 0; i < count; i++) {
        double mult = 100;
        double val = (double) (arc4random_uniform(mult)) + 10;
        [yVals4 addObject:[[ChartDataEntry alloc] initWithX:i y:val]];
    }
    
    for (int i = 0; i < count; i++) {
        double mult = 280;
        double val = (double) (arc4random_uniform(mult)) + 155;
        [yVals5 addObject:[[ChartDataEntry alloc] initWithX:i y:val]];
    }
    
    for (int i = 0; i < count; i++) {
        double mult = range;
        double val = (double) (arc4random_uniform(mult)) + 700;
        [yVals6 addObject:[[ChartDataEntry alloc] initWithX:i y:val]];
    }
    
    LineChartDataSet *set1 = nil, *set2 = nil, *set3 = nil, *set4 = nil, *set5 = nil, *set6 = nil;
    
    if (_lineChartView.data.dataSetCount > 0) {
        set1 = (LineChartDataSet *)_lineChartView.data.dataSets[0];
        set2 = (LineChartDataSet *)_lineChartView.data.dataSets[1];
        set3 = (LineChartDataSet *)_lineChartView.data.dataSets[2];
        set4 = (LineChartDataSet *)_lineChartView.data.dataSets[3];
        set5 = (LineChartDataSet *)_lineChartView.data.dataSets[4];
        set6 = (LineChartDataSet *)_lineChartView.data.dataSets[5];
        set1.values = yVals1;
        set2.values = yVals2;
        set3.values = yVals3;
        set4.values = yVals4;
        
        set5.values = yVals5;
        set6.values = yVals6;
        set1.drawCirclesEnabled = false;
        set1.mode = LineChartModeHorizontalBezier;
        [_lineChartView.data notifyDataChanged];
        [_lineChartView notifyDataSetChanged];
        
    } else {
        set1 = [[LineChartDataSet alloc] initWithValues:yVals1 label:@"光伏"];
        set1.axisDependency = AxisDependencyLeft;
        [set1 setColor:[UIColor blueColor]];
        [set1 setCircleColor:UIColor.whiteColor];
        set1.lineWidth = 2.0;
        set1.circleRadius = 3.0;
        set1.fillAlpha = 65/255.0;
        set1.fillColor = [UIColor blueColor];
        set1.highlightColor = [UIColor blueColor];
        set1.drawCircleHoleEnabled = NO;
        set1.drawCirclesEnabled = false;
        set1.drawValuesEnabled = false;
        set1.drawFilledEnabled = YES;
        set1.mode = LineChartModeHorizontalBezier;
        
        set2 = [[LineChartDataSet alloc] initWithValues:yVals2 label:@"电池"];
        set2.axisDependency = AxisDependencyLeft;
        [set2 setColor:UIColor.greenColor];
        [set2 setCircleColor:UIColor.whiteColor];
        set2.lineWidth = 2.0;
        set2.circleRadius = 3.0;
        set2.fillAlpha = 65/255.0;
        set2.fillColor = UIColor.yellowColor;
        set2.highlightColor = [UIColor colorWithRed:244/255.f green:117/255.f blue:117/255.f alpha:1.f];
        set2.drawCircleHoleEnabled = NO;
        set2.drawCirclesEnabled = false;
        set2.drawValuesEnabled = false;
        set2.drawFilledEnabled = YES;
        set2.fillColor = [UIColor greenColor];
        set2.mode = LineChartModeHorizontalBezier;
        
        set3 = [[LineChartDataSet alloc] initWithValues:yVals3 label:@"电网"];
        set3.axisDependency = AxisDependencyLeft;
        [set3 setColor:UIColor.yellowColor];
        [set3 setCircleColor:UIColor.whiteColor];
        set3.lineWidth = 2.0;
        set3.circleRadius = 3.0;
        set3.fillAlpha = 65/255.0;
        set3.fillColor = [UIColor blueColor];
        set3.highlightColor = [UIColor yellowColor];
        set3.drawCircleHoleEnabled = NO;
        set3.drawCirclesEnabled = false;
        set3.drawValuesEnabled = false;
        set3.drawFilledEnabled = YES;
        set3.fillColor = [UIColor yellowColor];
        set3.mode = LineChartModeHorizontalBezier;
        
        set4 = [[LineChartDataSet alloc] initWithValues:yVals4 label:@"用户"];
        set4.axisDependency = AxisDependencyLeft;
        [set4 setColor:[UIColor redColor]];
        [set4 setCircleColor:UIColor.whiteColor];
        set4.lineWidth = 2.0;
        set4.circleRadius = 3.0;
        set4.fillAlpha = 65/255.0;
        set4.fillColor = [UIColor redColor];
        set4.highlightColor = [UIColor colorWithRed:244/255.f green:117/255.f blue:117/255.f alpha:1.f];
        set4.drawCircleHoleEnabled = NO;
        set4.drawCirclesEnabled = false;
        set4.drawValuesEnabled = false;
        set4.drawFilledEnabled = YES;
        set4.fillColor = [UIColor redColor];
        set4.mode = LineChartModeHorizontalBezier;
        
        set5 = [[LineChartDataSet alloc] initWithValues:yVals5 label:@"电池量"];
        set5.axisDependency = AxisDependencyRight;
        [set5 setColor:[UIColor cyanColor]];
        [set5 setCircleColor:UIColor.whiteColor];
        set5.lineWidth = 2.0;
        set5.circleRadius = 3.0;
        set5.fillAlpha = 65/255.0;
        set5.highlightColor = [UIColor cyanColor];
        set5.drawCircleHoleEnabled = NO;
        set5.drawCirclesEnabled = false;
        set5.drawValuesEnabled = false;
        set5.mode = LineChartModeHorizontalBezier;
        
        set6 = [[LineChartDataSet alloc] initWithValues:yVals6 label:@"自发用户"];
        set6.axisDependency = AxisDependencyRight;
        [set6 setColor:[UIColor orangeColor]];
        [set6 setCircleColor:UIColor.whiteColor];
        set6.lineWidth = 2.0;
        set6.circleRadius = 3.0;
        set6.fillAlpha = 65/255.0;
        set6.highlightColor = [UIColor colorWithRed:244/255.f green:117/255.f blue:117/255.f alpha:1.f];
        set6.drawCircleHoleEnabled = NO;
        set6.drawCirclesEnabled = false;
        set6.drawValuesEnabled = false;
        set6.mode = LineChartModeHorizontalBezier;
        
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        [dataSets addObject:set2];
        [dataSets addObject:set3];
        [dataSets addObject:set4];
        
        [dataSets addObject:set5];
        [dataSets addObject:set6];
        
        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
        [data setValueTextColor:UIColor.whiteColor];
        [data setValueFont:[UIFont systemFontOfSize:9.f]];
        
        _lineChartView.data = data;
    }
}

#pragma mark - ChartViewDelegate

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    NSLog(@"chartValueSelected");
    
    [_lineChartView centerViewToAnimatedWithXValue:entry.x yValue:entry.y axis:[_lineChartView.data getDataSetByIndex:highlight.dataSetIndex].axisDependency duration:1.0];
    //[_chartView moveViewToAnimatedWithXValue:entry.x yValue:entry.y axis:[_chartView.data getDataSetByIndex:dataSetIndex].axisDependency duration:1.0];
    //[_chartView zoomAndCenterViewAnimatedWithScaleX:1.8 scaleY:1.8 xValue:entry.x yValue:entry.y axis:[_chartView.data getDataSetByIndex:dataSetIndex].axisDependency duration:1.0];
    
}

- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)chartView
{
    NSLog(@"chartValueNothingSelected");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
