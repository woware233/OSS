package com.oss.utils;

import com.oss.domain.Course;
import org.apache.poi.ss.formula.functions.T;

import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author hasee
 */
public class TestUtils {
    public static void main(String [] args) throws ClassNotFoundException {


//        Class clazz=Class.forName("com.oss.domain.UserTest");
//        Constructor[] constructors=clazz.getConstructors();
//        for (int i=0;i<constructors.length;i++){
//            Class[] clazz1=constructors[i].getParameterTypes();
//            System.out.print("第" + i + "个构造函数:"+constructors[i].getParameterTypes());
//           for (int j=0;j<clazz1.length;j++){
//               System.out.print("clazz:"+clazz1[j].getName());
//           }
//        }
               List<Integer> array=new ArrayList<Integer>();
               List<Integer> array2=new ArrayList<Integer>();
                for(int i=0;i<10;i++){
                    for(int j=0;j<10;j++){
                        int sum2=(int)(1+Math.random()*100);
                        array2.add(sum2);
                    }
                    System.out.println();
                  }
                Integer[][] a = new Integer[array.size()][array2.size()];
                 array.toArray(a);
                for(int i=0;i<array2.size();i++){
                    if(i%10 == 0) {
                        System.out.println("\t");
                    }
                        System.out.print(array2.get(i)+"\t");

                    }
                }



//
//                int start = 0;
//                int end = a.length-1;
//              //  sort(a,start,end);
//                for(int i = 0; i<a.length; i++){
//                    for(int j = 0; j<a.length; i++){
//                        System.out.print(a[i][j]+" ");
//
//                    }
//
//                }


            public static void sort(int[] a, int low, int high){
                int start = low;
                int end = high;
                int key = a[low];


                while(end>start){
                    //从后往前比较
                    // 如果没有比关键值小的，比较下一个，直到有比关键值小的交换位置，然后又从前往后比较
                    while(end>start&&a[end]>=key)
                    {
                        end--;
                    }
                    if(a[end]<=key){
                        int temp = a[end];
                        a[end] = a[start];
                        a[start] = temp;
                    }
                    //从前往后比较//如果没有比关键值大的，比较下一个，直到有比关键值大的交换位置
                    while(end>start&&a[start]<=key)
                    {
                        start++;
                    }
                    if(a[start]>=key){
                        int temp = a[start];
                        a[start] = a[end];
                        a[end] = temp;
                    }
                    //此时第一次循环比较结束，关键值的位置已经确定了。左边的值都比关键值小，右边的值都比关键值大，但是两边的顺序还有可能是不一样的，进行下面的递归调用
                }
                //递归
                if(start>low) {
                    //左边序列。第一个索引位置到关键值索引-1
                    sort(a,low,start-1);
                }
                if(end<high) {
                    //右边序列。从关键值索引+1到最后一个
                    sort(a,end+1,high);
                }
            }

        }


